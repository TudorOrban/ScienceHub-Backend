using sciencehub_community.Features.Chats.DTOs;
using sciencehub_core.Shared.Search;

namespace sciencehub_community.Features.Chats.Services
{
    public interface IChatService
    {
        Task<PaginatedResults<ChatSearchDTO>> SearchChatsByUserIdAsync(int userId, SearchParams searchParams, bool addUsers = false, bool isPublic = true);
        Task<ChatSearchDTO> GetChatByIdAsync(int chatId, bool addUsers = false);
    }
}