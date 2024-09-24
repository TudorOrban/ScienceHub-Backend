using sciencehub_core.Features.Submissions.Models;
using sciencehub_core.Features.Works.Models;

namespace sciencehub_core.Features.Submissions.VersionControlSystem.Reconstruction.Services
{
    public interface IWorkReconstructionService
    {
        Task<Work> FindWorkVersionData(int workId, string workType, int workVersionId);
        Task<List<WorkSubmission>> GetWorkSubmissionsAsync(Dictionary<string, string> path);
        int[] ConvertDictionaryToVersionPairs(Dictionary<string, string> path);
    }
}