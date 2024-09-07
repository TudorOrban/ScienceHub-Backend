using sciencehub_backend_core.Data;
using sciencehub_backend_core.Features.Projects.Models;
using sciencehub_backend_core.Shared.Search;
using Microsoft.EntityFrameworkCore;

namespace sciencehub_backend_core.Features.Projects.Repositories 
{
    public class ProjectRepository : IProjectRepository
    {
        private readonly CoreServiceDbContext _context;

        public ProjectRepository(CoreServiceDbContext context)
        {
            _context = context;
        }

        public async Task<PaginatedResults<Project>> GetProjectsByUserIdAsync(Guid userId, SearchParams searchParams)
        {
            IQueryable<Project> query = _context.Projects
                .Where(p => p.ProjectUsers.Any(pu => pu.UserId == userId));

            if (!string.IsNullOrWhiteSpace(searchParams.SearchQuery))
            {
                query = query.Where(p => p.Name.Contains(searchParams.SearchQuery) || p.Title.Contains(searchParams.SearchQuery));
            }

            query = ApplySorting(query, searchParams.SortBy, searchParams.SortDescending);

            var totalItemCount = await query.CountAsync();
            var projects = await query
                .Skip(((searchParams.Page ?? 1) - 1) * (searchParams.ItemsPerPage ?? 10))
                .Take(searchParams.ItemsPerPage ?? 10)
                .Include(p => p.ProjectUsers)
                    .ThenInclude(pu => pu.User)
                .ToListAsync();

            return new PaginatedResults<Project>
            {
                Results = projects,
                TotalCount = totalItemCount
            };
        }
        
        private IQueryable<Project> ApplySorting(IQueryable<Project> query, string? sortBy, bool descending)
        {
            switch (sortBy)
            {
                case "Name":
                    query = descending ? query.OrderByDescending(p => p.Name) : query.OrderBy(p => p.Name);
                    break;
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
    }
}