using sciencehub_backend_core.Core.Users.DTOs;
using sciencehub_backend_core.Features.Issues.Models;
using sciencehub_backend_core.Features.Projects.DTOs;
using sciencehub_backend_core.Features.Works.DTOs;
using sciencehub_backend_core.Shared.Enums;

namespace sciencehub_backend_core.Features.Issues.DTOs
{
    public class IssueSearchDTO
    {
        public int Id { get; set; }
        public IssueType IssueType { get; set; }
        public int? ProjectId { get; set; }
        public int? WorkId { get; set; }
        public WorkType? WorkType { get; set; }
        public string Title { get; set; } = string.Empty;
        public string? Description { get; set; }
        public DateTime? CreatedAt { get; set; }
        public IssueStatus? Status { get; set; }  
        public bool IsPublic { get; set; }      
        public List<IssueUser> IssueUsers { get; set; } = new List<IssueUser>();

        public List<UserSmallDTO> Users { get; set; } = new List<UserSmallDTO>();
        public ProjectSearchDTO? Project { get; set; }
        public WorkSearchDTO? Work { get; set; }
    }
}