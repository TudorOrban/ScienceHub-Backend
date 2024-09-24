using sciencehub_community.Features.Discussions.Models;
using sciencehub_core.Shared.Search;

namespace sciencehub_community.Features.Discussions.Repositories
{
    public interface IDiscussionRepository
    {
        Task<PaginatedResults<Discussion>> SearchDiscussionsByUserIdAsync(int userId, SearchParams searchParams);
    }
}