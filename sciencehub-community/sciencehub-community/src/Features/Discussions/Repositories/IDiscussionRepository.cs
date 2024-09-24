using sciencehub_backend_community.Features.Discussions.Models;
using sciencehub_backend_core.Shared.Search;

namespace sciencehub_backend_community.Features.Discussions.Repositories
{
    public interface IDiscussionRepository
    {
        Task<PaginatedResults<Discussion>> SearchDiscussionsByUserIdAsync(int userId, SearchParams searchParams);
    }
}