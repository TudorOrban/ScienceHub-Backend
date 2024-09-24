using sciencehub_core.Features.Projects.DTOs;
using sciencehub_core.Features.Projects.Models;
using sciencehub_core.Shared.Search;

namespace sciencehub_core.Features.Projects.Services
{
    public interface IProjectService
    {
        Task<PaginatedResults<ProjectSearchDTO>> GetProjectsByUserIdAsync(int userId, SearchParams searchParams, bool? small = false);
        Task<Project> GetProjectByIdAsync(int projectId);
        Task<Project> CreateProjectAsync(CreateProjectDTO createProjectDTO);

        Task<int> DeleteProjectAsync(int projectId);
    }
}