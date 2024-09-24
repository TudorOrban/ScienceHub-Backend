using Microsoft.EntityFrameworkCore;
using sciencehub_community.Data;
using sciencehub_community.Features.Discussions.Models;
using sciencehub_core.Shared.Search;

namespace sciencehub_community.Features.Discussions.Repositories
{
    public class DiscussionRepository : IDiscussionRepository
    {
        private readonly CommunityServiceDbContext _context;

        public DiscussionRepository(CommunityServiceDbContext context)
        {
            _context = context;
        }

        public async Task<PaginatedResults<Discussion>> SearchDiscussionsByUserIdAsync(int userId, SearchParams searchParams)
        {
            var query = _context.Discussions
                .Where(i => i.UserId == userId)
                .Where(i => i.IsPublic ?? false);

            if (!string.IsNullOrEmpty(searchParams.SearchTerm))
            {
                query = query.Where(i => i.Title.Contains(searchParams.SearchTerm));
            }

            query = ApplySorting(query, searchParams.SortBy, searchParams.SortDescending);

            var totalItemCount = await query.CountAsync();

            var Discussions = await query
                .Skip(((searchParams.Page ?? 1) - 1) * (searchParams.ItemsPerPage ?? 10))
                .Take(searchParams.ItemsPerPage ?? 10)
                .ToListAsync();

            return new PaginatedResults<Discussion>
            {
                Results = Discussions,
                TotalCount = totalItemCount
            };
        }
        
        private IQueryable<Discussion> ApplySorting(IQueryable<Discussion> query, string? sortBy, bool descending)
        {
            switch (sortBy)
            {
                case "title":
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