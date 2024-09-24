using Microsoft.EntityFrameworkCore.Storage;
using sciencehub_core.Features.Submissions.Models;

namespace sciencehub_core.Features.Submissions.VersionControlSystem.Services
{
    public interface IProjectSubmissionSubmitService
    {
        Task<ProjectSubmission> SubmitProjectSubmissionAsync(int projectSubmissionId, string currentUserIdString);
    }
}