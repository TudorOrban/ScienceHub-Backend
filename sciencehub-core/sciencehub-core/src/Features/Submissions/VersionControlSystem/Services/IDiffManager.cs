using sciencehub_core.Features.Submissions.VersionControlSystem.Models;
using sciencehub_core.Features.Works.Models;

namespace sciencehub_core.Features.Submissions.VersionControlSystem.Services
{
    public interface IDiffManager
    {
        void ApplyTextDiffsToWork(Work work, WorkDelta delta);
        void ApplyTextArraysToWork(Work work, WorkDelta delta);

    }
}