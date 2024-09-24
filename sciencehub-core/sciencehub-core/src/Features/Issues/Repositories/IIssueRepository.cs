using sciencehub_core.Features.Issues.Models;
using sciencehub_core.Shared.Enums;
using sciencehub_core.Shared.Search;

namespace sciencehub_core.Features.Issues.Repositories
{
    public interface IIssueRepository
    {
        Task<Issue> FindIssueByIdAsync(int issueId);
        Task<PaginatedResults<Issue>> SearchIssuesByUserIdAndIssueTypeAsync(int userId, IssueType issueType, SearchParams searchParams);
        Task<Issue> CreateIssueAsync(Issue newIssue, IEnumerable<string> userIdStrings);
        Task<Issue> UpdateIssueAsync(Issue Issue);
        Task<int> DeleteIssueAsync(int issueId);
    }
}