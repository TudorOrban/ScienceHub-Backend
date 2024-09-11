using Microsoft.EntityFrameworkCore;
using sciencehub_backend_core.Data;
using sciencehub_backend_core.Exceptions.Errors;
using sciencehub_backend_core.Features.Issues.Models;
using sciencehub_backend_core.Shared.Enums;
using sciencehub_backend_core.Shared.Search;

namespace sciencehub_backend_core.Features.Issues.Repositories
{
    public class IssueRepository : IIssueRepository
    {
        private readonly CoreServiceDbContext _context;

        public IssueRepository(CoreServiceDbContext context)
        {
            _context = context;
        }

        public async Task<Issue> FindIssueByIdAsync(int issueId)
        {
            var issue = await _context.Issues.FindAsync(issueId);
            if (issue == null)
            {
                throw new ResourceNotFoundException("Issue", issueId.ToString());
            }

            return issue;
        }

        // Search
        public async Task<PaginatedResults<Issue>> SearchIssuesByUserIdAndIssueTypeAsync(int userId, IssueType issueType, SearchParams searchParams)
        {
            var query = _context.Issues
                .Include(i => i.IssueUsers)
                    .ThenInclude(iu => iu.User)
                .Where(i => i.IssueUsers.Any(iu => iu.UserId == userId))
                .Where(i => i.IssueType == issueType)
                .Where(i => i.IsPublic ?? false);

            if (!string.IsNullOrEmpty(searchParams.SearchTerm))
            {
                query = query.Where(i => i.Title.Contains(searchParams.SearchTerm));
            }

            query = ApplySorting(query, searchParams.SortBy, searchParams.SortDescending);

            var totalItemCount = await query.CountAsync();

            var Issues = await query
                .Skip(((searchParams.Page ?? 1) - 1) * (searchParams.ItemsPerPage ?? 10))
                .Take(searchParams.ItemsPerPage ?? 10)
                .ToListAsync();

            return new PaginatedResults<Issue>
            {
                Results = Issues,
                TotalCount = totalItemCount
            };
        }
        
        private IQueryable<Issue> ApplySorting(IQueryable<Issue> query, string? sortBy, bool descending)
        {
            switch (sortBy)
            {
                case "Title":
                    query = descending ? query.OrderByDescending(p => p.Title) : query.OrderBy(p => p.Title);
                    break;
                case "createdAt":
                    query = descending ? query.OrderByDescending(p => p.CreatedAt) : query.OrderBy(p => p.CreatedAt);
                    break;
                default:
                    throw new ArgumentException("Invalid sort field", nameof(sortBy));
            }
            return query;
        }

        public async Task<List<Issue>> FindIssuesByIdAsync(int Id, IssueType issueType)
        {
            return await _context.Issues.Where(pr => pr.Id == Id && pr.IssueType == issueType).ToListAsync();
        }

        // Create
        public async Task<Issue> CreateIssueAsync(Issue newIssue, IEnumerable<string> userIdStrings)
        {
            _context.Issues.Add(newIssue);
            await _context.SaveChangesAsync();

            await AddUsersToIssueAsync(userIdStrings, newIssue.Id);

            return newIssue;
        }

        private async Task AddUsersToIssueAsync(IEnumerable<string> userIdStrings, int issueId)
        {
            foreach (var userIdString in userIdStrings)
            {
                if (!int.TryParse(userIdString, out var userId))
                {
                    return;
                }
                _context.IssueUsers.Add(new IssueUser { IssueId = issueId, UserId = userId });
            }
            await _context.SaveChangesAsync();
        }

        // Update
        public async Task<Issue> UpdateIssueAsync(Issue Issue)
        {
            _context.Issues.Update(Issue);
            await _context.SaveChangesAsync();

            return Issue;
        }

        // Delete
        public async Task<int> DeleteIssueAsync(int issueId)
        {
            var issue = await FindIssueByIdAsync(issueId);
            _context.Issues.Remove(issue);
            return await _context.SaveChangesAsync();
        }
    }
}