
using Microsoft.EntityFrameworkCore;
using sciencehub_community.Data;
using sciencehub_community.Features.Chats.Models;
using sciencehub_core.Shared.Search;

namespace sciencehub_community.Features.Chats.Repositories
{
    public class ChatMessageRepository : IChatMessageRepository
    {
        private readonly CommunityServiceDbContext _context;

        public ChatMessageRepository(CommunityServiceDbContext context)
        {
            _context = context;
        }

        public async Task<PaginatedResults<ChatMessage>> SearchChatMessagesByChatIdAsync(int chatId, SearchParams searchParams)
        {
            var query = _context.ChatMessages
                .Where(chatMessage => chatMessage.ChatId == chatId);

            if (!string.IsNullOrEmpty(searchParams.SearchTerm))
            {
                query = query.Where(i => i.Content != null && i.Content.Contains(searchParams.SearchTerm));
            }

            query = ApplySorting(query, searchParams.SortBy, searchParams.SortDescending);

            var totalItemCount = await query.CountAsync();

            var ChatMessages = await query
                .Skip(((searchParams.Page ?? 1) - 1) * (searchParams.ItemsPerPage ?? 10))
                .Take(searchParams.ItemsPerPage ?? 10)
                .ToListAsync();

            return new PaginatedResults<ChatMessage>
            {
                Results = ChatMessages,
                TotalCount = totalItemCount
            };
        }
        
        private IQueryable<ChatMessage> ApplySorting(IQueryable<ChatMessage> query, string? sortBy, bool descending)
        {
            switch (sortBy)
            {
                case "title":
                    query = descending ? query.OrderByDescending(p => p.Content) : query.OrderBy(p => p.Content);
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