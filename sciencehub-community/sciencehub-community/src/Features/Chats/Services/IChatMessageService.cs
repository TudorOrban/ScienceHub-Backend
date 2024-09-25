using sciencehub_community.Features.Chats.DTOs;
using sciencehub_core.Shared.Search;

namespace sciencehub_community.Features.Chats.Services
{
    public interface IChatMessageService
    {
        Task<PaginatedResults<ChatMessageSearchDTO>> SearchChatMessagesByChatIdAsync(int chatId, SearchParams searchParams, bool addUsers = false);
    }
}