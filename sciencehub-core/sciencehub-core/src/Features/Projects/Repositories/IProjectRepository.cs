
using sciencehub_core.Features.Projects.Models;
using sciencehub_core.Shared.Search;

namespace sciencehub_core.Features.Projects.Repositories
{
    public interface IProjectRepository
    {
        Task<PaginatedResults<Project>> GetProjectsByUserIdAsync(int userId, SearchParams searchParams);
    }
}