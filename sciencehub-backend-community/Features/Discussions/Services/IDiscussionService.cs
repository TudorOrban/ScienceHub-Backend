using sciencehub_backend_community.Features.Discussions.DTOs;
using sciencehub_backend_core.Shared.Search;

namespace sciencehub_backend_community.Features.Discussions.Services
{
    public interface IDiscussionService
    {
        Task<PaginatedResults<DiscussionSearchDTO>> SearchDiscussionsByUserIdAsync(int userId, SearchParams searchParams);
    }
}