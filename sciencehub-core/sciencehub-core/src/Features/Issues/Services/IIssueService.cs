using sciencehub_backend_core.Features.Issues.DTOs;
using sciencehub_backend_core.Features.Issues.Models;
using sciencehub_backend_core.Shared.Enums;
using sciencehub_backend_core.Shared.Search;

namespace sciencehub_backend_core.Features.Issues.Services
{
    public interface IIssueService
    {
        Task<Issue> GetIssueByIdAsync(int issueId);
        Task<PaginatedResults<IssueSearchDTO>> SearchIssuesByUserIdAndIssueTypeAsync(int userId, IssueType issueType, SearchParams searchParams, bool? small = true);
        Task<Issue> CreateIssueAsync(CreateIssueDTO createIssueDTO);
        Task<Issue> UpdateIssueAsync(UpdateIssueDTO updateIssueDTO);
        Task<int> DeleteIssueAsync(int issueId);
    }
}