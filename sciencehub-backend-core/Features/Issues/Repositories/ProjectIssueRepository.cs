using Microsoft.EntityFrameworkCore;
using sciencehub_backend_core.Data;
using sciencehub_backend_core.Exceptions.Errors;
using sciencehub_backend_core.Features.Issues.Models;
using sciencehub_backend_core.Shared.Search;

namespace sciencehub_backend_core.Features.Issues.Repositories
{
    public class ProjectIssueRepository : IProjectIssueRepository
    {
        private readonly CoreServiceDbContext _context;

        public ProjectIssueRepository(CoreServiceDbContext context)
        {
            _context = context;
        }

        public async Task<ProjectIssue> FindProjectIssueByIdAsync(int issueId)
        {
            var issue = await _context.ProjectIssues.FindAsync(issueId);
            if (issue == null)
            {
                throw new InvalidProjectIssueIdException();
            }

            return issue;
        }

        // Search
        public async Task<PaginatedResults<ProjectIssue>> SearchProjectIssuesByProjectIdAsync(int projectId, SearchParams searchParams)
        {
            var query = _context.ProjectIssues
                .Where(pr => pr.ProjectId == projectId);

            if (!string.IsNullOrEmpty(searchParams.SearchTerm))
            {
                query = query.Where(pr => pr.Title.Contains(searchParams.SearchTerm));
            }

            query = ApplySorting(query, searchParams.SortBy, searchParams.SortDescending);

            var totalItemCount = await query.CountAsync();

            var projectIssues = await query
                .Skip(((searchParams.Page ?? 1) - 1) * (searchParams.ItemsPerPage ?? 10))
                .Take(searchParams.ItemsPerPage ?? 10)
                .ToListAsync();

            return new PaginatedResults<ProjectIssue>
            {
                Results = projectIssues,
                TotalCount = totalItemCount
            };
        }

        public async Task<PaginatedResults<ProjectIssue>> SearchProjectIssuesByUserIdAsync(int userId, SearchParams searchParams) 
        {
            var query = _context.ProjectIssues
                .Include(i => i.ProjectIssueUsers)
                    .ThenInclude(iu => iu.User)
                .Where(pr => pr.ProjectIssueUsers.Any(pu => pu.UserId == userId));

            if (!string.IsNullOrEmpty(searchParams.SearchTerm))
            {
                query = query.Where(pr => pr.Title.Contains(searchParams.SearchTerm));
            }

            query = ApplySorting(query, searchParams.SortBy, searchParams.SortDescending);

            var totalItemCount = await query.CountAsync();

            var projectIssues = await query
                .Skip(((searchParams.Page ?? 1) - 1) * (searchParams.ItemsPerPage ?? 10))
                .Take(searchParams.ItemsPerPage ?? 10)
                .ToListAsync();

            return new PaginatedResults<ProjectIssue>
            {
                Results = projectIssues,
                TotalCount = totalItemCount
            };
        }
        
        private IQueryable<ProjectIssue> ApplySorting(IQueryable<ProjectIssue> query, string? sortBy, bool descending)
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

        public async Task<List<ProjectIssue>> FindProjectIssuesByProjectIdAsync(int projectId)
        {
            return await _context.ProjectIssues.Where(pr => pr.ProjectId == projectId).ToListAsync();
        }

        // Create
        public async Task<ProjectIssue> CreateProjectIssueAsync(ProjectIssue newProjectIssue, IEnumerable<string> userIdStrings)
        {
            _context.ProjectIssues.Add(newProjectIssue);
            await _context.SaveChangesAsync();

            await AddUsersToIssueAsync(userIdStrings, newProjectIssue.Id);

            return newProjectIssue;
        }

        private async Task AddUsersToIssueAsync(IEnumerable<string> userIdStrings, int issueId)
        {
            foreach (var userIdString in userIdStrings)
            {
                if (!int.TryParse(userIdString, out var userId))
                {
                    return;
                }
                _context.ProjectIssueUsers.Add(new ProjectIssueUser { ProjectIssueId = issueId, UserId = userId });
            }
            await _context.SaveChangesAsync();
        }

        // Update
        public async Task<ProjectIssue> UpdateProjectIssueAsync(ProjectIssue projectIssue)
        {
            _context.ProjectIssues.Update(projectIssue);
            await _context.SaveChangesAsync();

            return projectIssue;
        }

        // Delete
        public async Task<int> DeleteProjectIssueAsync(int issueId)
        {
            var issue = await FindProjectIssueByIdAsync(issueId);
            _context.ProjectIssues.Remove(issue);
            return await _context.SaveChangesAsync();
        }
    }
}