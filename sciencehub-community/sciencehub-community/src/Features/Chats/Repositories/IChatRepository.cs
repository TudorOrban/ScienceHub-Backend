using sciencehub_backend_community.Features.Chats.Models;
using sciencehub_backend_core.Shared.Search;

namespace sciencehub_backend_community.Features.Chats.Repositories
{
    public interface IChatRepository
    {
        Task<PaginatedResults<Chat>> SearchChatsByUserIdAsync(int userId, SearchParams searchParams, bool isPublic = false);
    }
}