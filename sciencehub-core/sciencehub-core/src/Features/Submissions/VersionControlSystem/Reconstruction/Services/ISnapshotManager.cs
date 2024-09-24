using sciencehub_core.Features.Projects.Models;
using sciencehub_core.Features.Works.Models;
using sciencehub_core.Features.Submissions.VersionControlSystem.Models;

namespace sciencehub_core.Features.Submissions.VersionControlSystem.Reconstruction.Services
{
    public interface ISnapshotManager
    {
        bool ShouldTakeSnapshot(GraphData graph, List<VersionEdge> edges, string newVersion, int newDeltaSize);
        (string?, Dictionary<string, string>, int) FindClosestSnapshot(GraphData graph, string currentVersion);
        int ComputeWorkSnapshotSize(Work work);
        int ComputeProjectSnapshotSize(Project project);
    }
}