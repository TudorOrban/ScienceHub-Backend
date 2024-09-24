using sciencehub_core.Features.Submissions.DTO;
using sciencehub_core.Features.Submissions.Models;

namespace sciencehub_core.Features.Submissions.Services
{
    public interface ISubmissionService
    {
        Task<WorkSubmission> GetWorkSubmissionAsync(int workSubmissionId);    
        Task<int> CreateSubmissionAsync(CreateSubmissionDTO createSubmissionDTO);

    
    
    }
}