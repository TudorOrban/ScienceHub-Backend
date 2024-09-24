using sciencehub_core.Features.Works.Models;
using sciencehub_core.Shared.Enums;
using sciencehub_core.Shared.Search;

namespace sciencehub_core.Features.Works.Repositories
{
    public interface IWorkRepository
    {
        Task<Work> GetWorkAsync(int workId);
        Task<IEnumerable<Work>> GetWorksByProjectIdAsync(int projectId);
        Task<IEnumerable<Work>> GetWorksByUserIdAsync(int userId);
        Task<IEnumerable<Work>> GetWorksByTypeAndUserIdAsync(WorkType type, int userId);
        Task<IEnumerable<Work>> GetWorksByTypeAndProjectIdAsync(WorkType type, int projectId);
        Task<PaginatedResults<Work>> SearchWorksByTypeAndUserIdAsync(int userId, WorkType workType, SearchParams searchParams);

        Task<Work> CreateWorkAsync(Work work);
        Task<Work> UpdateWorkAsync(Work work);
        Task DeleteWorkAsync(int workId);
    }
}