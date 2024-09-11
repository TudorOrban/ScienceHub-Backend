using sciencehub_backend_core.Core.Users.DTOs;
using sciencehub_backend_core.Features.Issues.Models;
using sciencehub_backend_core.Shared.Enums;

namespace sciencehub_backend_core.Features.Issues.DTOs
{
    public class WorkIssueSearchDTO
    {
        public int Id { get; set; }
        public int? WorkId { get; set; }
        public WorkType WorkType { get; set; }
        public string Title { get; set; } = string.Empty;
        public string? Description { get; set; }
        public DateTime? CreatedAt { get; set; }
        public IssueStatus? Status { get; set; }        
        public List<WorkIssueUser> WorkIssueUsers { get; set; } = new List<WorkIssueUser>();
        public List<UserSmallDTO> Users { get; set; } = new List<UserSmallDTO>();
    }
}