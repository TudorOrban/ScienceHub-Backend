using sciencehub_core.Features.Projects.Models;
using sciencehub_core.Shared.Enums;
using sciencehub_core.Features.Submissions.VersionControlSystem.Reconstruction.Models;

namespace sciencehub_core.Features.Submissions.VersionControlSystem.Reconstruction.Services
{
    public interface IGraphService
    {
        Task<WorkGraph> FetchWorkGraph(int workId, WorkType workType);
        Task<ProjectGraph> FetchProjectGraph(int projectId);
        Task UpdateProjectGraphAsync(int projectId, int initialProjectVersionId, int finalProjectVersionId);
        Task UpdateWorkGraphAsync(int workId, WorkType workType, int initialWorkVersionId, int finalWorkVersionId);
    }
}