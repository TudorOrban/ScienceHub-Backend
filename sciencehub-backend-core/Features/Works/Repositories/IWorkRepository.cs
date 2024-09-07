using sciencehub_backend_core.Features.Works.Models;
using sciencehub_backend_core.Shared.Enums;
using sciencehub_backend_core.Shared.Search;

namespace sciencehub_backend_core.Features.Works.Repositories
{
    public interface IWorkRepository
    {
        Task<Work> GetWorkAsync(int workId);
        Task<IEnumerable<Work>> GetWorksByProjectIdAsync(int projectId);
        Task<IEnumerable<Work>> GetWorksByUserIdAsync(Guid userId);
        Task<IEnumerable<Work>> GetWorksByTypeAndUserIdAsync(WorkType type, Guid userId);
        Task<IEnumerable<Work>> GetWorksByTypeAndProjectIdAsync(WorkType type, int projectId);
        Task<PaginatedResults<Work>> SearchWorksByTypeAndUserIdAsync(Guid userId, WorkType workType, SearchParams searchParams);

        Task<Work> CreateWorkAsync(Work work);
        Task<Work> UpdateWorkAsync(Work work);
        Task DeleteWorkAsync(int workId);
    }
}