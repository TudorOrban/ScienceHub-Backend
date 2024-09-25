using sciencehub_community.Features.Chats.Models;
using sciencehub_core.Shared.Search;

namespace sciencehub_community.Features.Chats.Repositories
{
    public interface IChatMessageRepository
    {
        Task<PaginatedResults<ChatMessage>> SearchChatMessagesByChatIdAsync(int chatId, SearchParams searchParams);
    }
}