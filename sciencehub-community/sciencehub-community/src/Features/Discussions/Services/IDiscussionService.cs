using sciencehub_community.Features.Discussions.DTOs;
using sciencehub_core.Shared.Search;

namespace sciencehub_community.Features.Discussions.Services
{
    public interface IDiscussionService
    {
        Task<PaginatedResults<DiscussionSearchDTO>> SearchDiscussionsByUserIdAsync(int userId, SearchParams searchParams);
    }
}