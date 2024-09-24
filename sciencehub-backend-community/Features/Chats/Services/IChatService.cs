using sciencehub_backend_community.Features.Chats.DTOs;
using sciencehub_backend_core.Shared.Search;

namespace sciencehub_backend_community.Features.Chats.Services
{
    public interface IChatService
    {
        Task<PaginatedResults<ChatSearchDTO>> SearchChatsByUserIdAsync(int userId, SearchParams searchParams, bool addUsers = false, bool isPublic = true);
    }
}