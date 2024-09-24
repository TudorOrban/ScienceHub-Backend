using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage;
using sciencehub_backend_core.Core.Users.DTOs;
using sciencehub_backend_core.Core.Users.Models;
using sciencehub_backend_core.Data;
using sciencehub_backend_core.Exceptions.Errors;
using sciencehub_backend_core.Features.Submissions.Models;
using sciencehub_backend_core.Features.Submissions.VersionControlSystem.Models;
using sciencehub_backend_core.Features.Submissions.VersionControlSystem.Reconstruction.Services;
using sciencehub_backend_core.Features.Works.Models;
using sciencehub_backend_core.Features.Works.Repositories;
using sciencehub_backend_core.Shared.Enums;
using sciencehub_backend_core.Shared.Validation;

namespace sciencehub_backend_core.Features.Submissions.VersionControlSystem.Services
{
    public class WorkSubmissionAcceptService : IWorkSubmissionAcceptService
    {
        private readonly CoreServiceDbContext _context;
        private readonly ILogger<WorkSubmissionAcceptService> _logger;
        private readonly IWorkRepository _workRepository;
        private readonly IDiffManager _diffManager;
        private readonly ISnapshotService _snapshotService;
        private readonly IDatabaseValidation _databaseValidation;

        public WorkSubmissionAcceptService(
            CoreServiceDbContext context, 
            IWorkRepository workRepository,
            ISnapshotService snapshotService, 
            ILogger<WorkSubmissionAcceptService> logger, 
            IDiffManager diffManager, 
            IDatabaseValidation databaseValidation
        )
        {
            _context = context;
            _logger = logger;
            _workRepository = workRepository;
            _diffManager = diffManager;
            _snapshotService = snapshotService;
            _databaseValidation = databaseValidation;
        }

        public async Task<WorkSubmission> AcceptWorkSubmissionAsync(int workSubmissionId, string currentUserIdString, bool? bypassPermissions = false, IDbContextTransaction? transaction = null)
        {
            // Start transaction if not already started by AcceptProjectSubmissionAsync
            var currentTransaction = transaction ?? await _context.Database.BeginTransactionAsync();

            try
            {
                // Fetch work submission
                var workSubmission = await _context.WorkSubmissions
                    .Include(ws => ws.ProjectWorkSubmissions)
                    .SingleOrDefaultAsync(ws => ws.Id == workSubmissionId);

                if (workSubmission == null)
                {
                    throw new InvalidSubmissionIdException();
                }

                // Fetch work
                var work = await _workRepository.GetWorkAsync(workSubmission.WorkId);

                // Permissions
                await ProcessPermissionsAsync(currentUserIdString, workSubmission, work, work.WorkUsers, bypassPermissions ?? false);

                // Trigger lazy loading
                var workMetadata = work.WorkMetadata;
                var workDelta = workSubmission.WorkDelta;

                // Apply text diffs and text arrays to work properties
                _diffManager.ApplyTextDiffsToWork(work, workSubmission.WorkDelta);
                _diffManager.ApplyTextArraysToWork(work, workSubmission.WorkDelta);

                // Update file location if necessary
                var fileLocation = workSubmission.FileChanges.fileToBeAdded ?? workSubmission.FileChanges.fileToBeUpdated;
                if (fileLocation != null)
                {
                    work.FileLocation = fileLocation;
                }

                // Update current version id
                work.CurrentWorkVersionId = workSubmission.FinalWorkVersionId;

                // Save updated work
                await _context.SaveChangesAsync();

                // Update submission with status and Accepted data
                await UpdateSubmissionAsync(workSubmission, work.WorkUsers, currentUserIdString);

                // Manage older versions
                await _snapshotService.ProcessWorkSnapshot(work, workSubmission);

                // Commit transaction, only if function is used independently (not as part of the larger transaction AcceptProjectSubmissionAsync)
                if (transaction == null)
                {
                    currentTransaction.Commit();
                }

                // TODO: Delete an old bucket file if necessary
                // In the future, keep old file once enough storage is secured
                // TODO: Add work submission users to work users as "Contributor" if not already present

                return workSubmission;
            }
            catch (Exception ex)
            {
                if (transaction == null)
                {
                    currentTransaction.Rollback();
                }
                _logger.LogError($"Error accepting submission: {ex.Message}");
                throw;
            }
        }

        // Permissions to accept submission
        private async Task ProcessPermissionsAsync(string currentUserIdString, WorkSubmission workSubmission, Work work, IEnumerable<WorkUser> workUsers, bool bypassPermissions)
        {
            // Skip permission checks if bypassPermissions
            if (bypassPermissions)
            {
                return;
            }

            /* 
            Permissions: 
            -valid current id, 
            -work submission not belong to a project submission, 
            -current user is main author
            -current submission status is Submitted
            -current version id is the same as the initial version id of the submission
            */
            var currentUserId = await _databaseValidation.ValidateUserId(currentUserIdString);

            bool isAttachedToProjectSubmission = workSubmission?.ProjectWorkSubmissions?.Any() ?? false;
            if (isAttachedToProjectSubmission)
            {
                throw new Exception("The submission cannot be accepted as it is attached to a project submission.");
            }

            var isWorkMainAuthor = workUsers.Any(u => u.UserId == currentUserId && u.Role == "Main Author");
            if (!isWorkMainAuthor)
            {
                throw new Exception("Not authorized to accept the submission");
            }

            var isWrongStatus1 = workSubmission?.Status == SubmissionStatus.InProgress;
            if (isWrongStatus1)
            {
                throw new Exception("The submission cannot be accepted as it has not been submitted yet.");
            }
            var isWrongStatus2 = workSubmission?.Status == SubmissionStatus.Accepted;
            if (isWrongStatus2)
            {
                throw new Exception("The submission has already been accepted.");
            }

            // TODO: Remove this constraint in the future with merging
            var isCorrectVersion = workSubmission?.InitialWorkVersionId == work.CurrentWorkVersionId;
            if (!isCorrectVersion)
            {
                throw new Exception("The work has been updated since the submission was made.");
            }
        }
        

        private async Task UpdateSubmissionAsync(WorkSubmission workSubmission, IEnumerable<WorkUser> workUsers, string currentUserIdString)
        {
            // Update submission status
            workSubmission.Status = SubmissionStatus.Accepted;

            // Record user and date of acceptance 
            AcceptedData acceptedData = new AcceptedData
            {
                Date = DateTime.UtcNow.ToString("yyyy-MM-ddTHH:mm:ssK"),
                Users = workUsers
                        .Where(wu => wu.UserId.ToString() == currentUserIdString)
                        .Select(wu => new SmallUser
                        {
                            Id = wu.UserId.ToString(),
                            Username = wu.User.Username,
                            FullName = wu.User.FullName
                        }).ToArray()
            };
            workSubmission.AcceptedData = acceptedData;
            await _context.SaveChangesAsync();
        }
    }
};