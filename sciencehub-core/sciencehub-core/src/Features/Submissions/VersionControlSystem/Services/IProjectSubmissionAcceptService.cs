using sciencehub_core.Core.Users.Models;
using sciencehub_core.Features.Submissions.Models;

namespace sciencehub_core.Features.Submissions.VersionControlSystem.Services
{
    public interface IProjectSubmissionAcceptService
    {
        Task<ProjectSubmission> AcceptProjectSubmissionAsync(int projectSubmissionId, string currentUserIdString);
    }
}