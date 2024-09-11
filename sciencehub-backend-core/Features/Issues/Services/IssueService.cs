using sciencehub_backend_core.Core.Users.DTOs;
using sciencehub_backend_core.Exceptions.Errors;
using sciencehub_backend_core.Features.Issues.DTOs;
using sciencehub_backend_core.Features.Issues.Models;
using sciencehub_backend_core.Features.Issues.Repositories;
using sciencehub_backend_core.Shared.Enums;
using sciencehub_backend_core.Shared.Sanitation;
using sciencehub_backend_core.Shared.Search;

namespace sciencehub_backend_core.Features.Issues.Services
{
    public class IssueService : IIssueService
    {
        private readonly IIssueRepository _IssueRepository;
        private readonly ISanitizerService _sanitizerService;

        public IssueService(IIssueRepository IssueRepository, ISanitizerService sanitizerService)
        {
            _IssueRepository = IssueRepository;
            _sanitizerService = sanitizerService;
        }

        public async Task<Issue> GetIssueByIdAsync(int issueId)
        {
            return await _IssueRepository.FindIssueByIdAsync(issueId);
        }

        public async Task<PaginatedResults<IssueSearchDTO>> SearchIssuesByUserIdAndIssueTypeAsync(int id, IssueType issueType, SearchParams searchParams, bool? small = true)
        {
            var issues = await _IssueRepository.SearchIssuesByUserIdAndIssueTypeAsync(id, issueType, searchParams);

            return new PaginatedResults<IssueSearchDTO>
            {
                Results = issues.Results.Select(r => MapToIssueSearchDTO(r, small)).ToList(),
                TotalCount = issues.TotalCount
            };
        }

        private IssueSearchDTO MapToIssueSearchDTO(Issue r, bool? small)
        {
            var issueDTO = new IssueSearchDTO
            {
                Id = r.Id,
                Title = r.Title,
                Name = r.Name,
                Description = r.Description,                    
                CreatedAt = r.CreatedAt,
                Users = r.IssueUsers.Select(u => new UserSmallDTO
                {
                    Id = u.UserId,
                    Username = u.User.Username,
                    FullName = u.User.FullName
                }).ToList()
            };

            return issueDTO;
        }

        public async Task<Issue> CreateIssueAsync(CreateIssueDTO createIssueDTO)
        {
            if (createIssueDTO.WorkId == null || !createIssueDTO.WorkId.HasValue)
            {
                throw new ResourceNotFoundException("Work", (!createIssueDTO.WorkId.HasValue) ? "null" : createIssueDTO.WorkId.Value.ToString());
            }
            var newIssue = new Issue
            {
                Id = createIssueDTO.WorkId.Value,
                Title = _sanitizerService.Sanitize(createIssueDTO.Title),
                Name = _sanitizerService.Sanitize(createIssueDTO.Name),
                Description = _sanitizerService.Sanitize(createIssueDTO.Description),
                IsPublic = createIssueDTO.IsPublic,
            };

            await _IssueRepository.CreateIssueAsync(newIssue, createIssueDTO.Users);

            return newIssue;
        }

        public async Task<Issue> UpdateIssueAsync(UpdateIssueDTO updateIssueDTO)
        {
            var Issue = await _IssueRepository.FindIssueByIdAsync(updateIssueDTO.Id);

            Issue.Title = _sanitizerService.Sanitize(updateIssueDTO.Title);
            Issue.Name = _sanitizerService.Sanitize(updateIssueDTO.Name);
            Issue.Description = _sanitizerService.Sanitize(updateIssueDTO.Description);
            Issue.IsPublic = updateIssueDTO.IsPublic;

            await _IssueRepository.UpdateIssueAsync(Issue);
            return Issue;
        }

        public async Task<int> DeleteIssueAsync(int issueId)
        {
            var issue = await _IssueRepository.FindIssueByIdAsync(issueId);
            if (issue == null)
            {
                throw new ResourceNotFoundException("Issue", issueId.ToString());
            }

            return await _IssueRepository.DeleteIssueAsync(issueId);
        }

    }
}