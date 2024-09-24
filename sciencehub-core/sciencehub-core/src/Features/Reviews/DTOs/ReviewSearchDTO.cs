using sciencehub_backend_core.Core.Users.DTOs;
using sciencehub_backend_core.Features.Reviews.Models;
using sciencehub_backend_core.Features.Projects.DTOs;
using sciencehub_backend_core.Features.Works.DTOs;
using sciencehub_backend_core.Shared.Enums;

namespace sciencehub_backend_core.Features.Reviews.DTOs
{
    public class ReviewSearchDTO
    {
        public int Id { get; set; }
        public ReviewType ReviewType { get; set; }
        public int? ProjectId { get; set; }
        public int? WorkId { get; set; }
        public WorkType? WorkType { get; set; }
        public string Title { get; set; } = string.Empty;
        public string Name { get; set; } = string.Empty;
        public string? Description { get; set; }
        public DateTime? CreatedAt { get; set; }
        public ReviewStatus? Status { get; set; }  
        public bool IsPublic { get; set; }      
        public List<ReviewUser> ReviewUsers { get; set; } = new List<ReviewUser>();

        public List<UserSmallDTO> Users { get; set; } = new List<UserSmallDTO>();
        public ProjectSearchDTO? Project { get; set; }
        public WorkSearchDTO? Work { get; set; }
    }
}