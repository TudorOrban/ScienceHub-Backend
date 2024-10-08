using sciencehub_core.Features.Works.DTOs;
using sciencehub_core.Features.Works.Models;
using sciencehub_core.Shared.Enums;
using sciencehub_core.Shared.Search;

namespace sciencehub_core.Features.Works.Services
{
    public interface IWorkService
    {
        Task<WorkDetailsDTO> GetWorkDetailsAsync(int workId);
        Task<IEnumerable<WorkSearchDTO>> GetWorksByUserIdAsync(int userId);
        Task<IEnumerable<WorkSearchDTO>> GetWorksByProjectIdAsync(int projectId);
        Task<IEnumerable<WorkSearchDTO>> GetWorksByTypeAndUserIdAsync(WorkType workType, int userId);
        Task<IEnumerable<WorkSearchDTO>> GetWorksByTypeAndProjectIdAsync(WorkType workType, int projectId);
        Task<PaginatedResults<WorkSearchDTO>> SearchWorksByTypeAndUserIdAsync(int userId, WorkType workType, SearchParams searchParams);
        Task<WorkDetailsDTO> CreateWorkAsync(CreateWorkDTO workDTO);
        Task<WorkDetailsDTO> UpdateWorkAsync(UpdateWorkDTO workDTO);
        Task<int> DeleteWorkAsync(int workId);
    }
}