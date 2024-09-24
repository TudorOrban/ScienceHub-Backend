using Microsoft.EntityFrameworkCore;
using sciencehub_community.Data;
using sciencehub_community.Features.Chats.Models;
using sciencehub_core.Shared.Search;

namespace sciencehub_community.Features.Chats.Repositories
{
    public class ChatRepository : IChatRepository
    {
        private readonly CommunityServiceDbContext _context;

        public ChatRepository(CommunityServiceDbContext context)
        {
            _context = context;
        }

        public async Task<PaginatedResults<Chat>> SearchChatsByUserIdAsync(int userId, SearchParams searchParams, bool isPublic = false)
        {
            var query = _context.Chats
                .Where(chat => chat.Users != null && chat.Users.ChatUsers != null && 
                    chat.Users.ChatUsers.Any(user => user.UserId == userId));

            if (isPublic)
            {
                query = query.Where(chat => chat.IsPublic ?? false);
            }

            if (!string.IsNullOrEmpty(searchParams.SearchTerm))
            {
                query = query.Where(i => i.Title != null && i.Title.Contains(searchParams.SearchTerm));
            }

            query = ApplySorting(query, searchParams.SortBy, searchParams.SortDescending);

            var totalItemCount = await query.CountAsync();

            var Chats = await query
                .Skip(((searchParams.Page ?? 1) - 1) * (searchParams.ItemsPerPage ?? 10))
                .Take(searchParams.ItemsPerPage ?? 10)
                .ToListAsync();

            return new PaginatedResults<Chat>
            {
                Results = Chats,
                TotalCount = totalItemCount
            };
        }
        
        private IQueryable<Chat> ApplySorting(IQueryable<Chat> query, string? sortBy, bool descending)
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