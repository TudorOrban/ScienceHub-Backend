using sciencehub_backend_core.Features.Works.Models;
using sciencehub_backend_core.Features.Submissions.VersionControlSystem.Models;
using sciencehub_backend_core.Shared.Enums;
using sciencehub_backend_core.Core.Users.DTOs;

namespace sciencehub_backend_core.Features.Works.DTOs
{
    public class WorkSearchDTO
    {
        public int Id { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
        public WorkType WorkType { get; set; }
        public string Title { get; set; } = string.Empty;
        public string Name { get; set; } = string.Empty;
        public string? Description { get; set; }
        public float? ResearchScore { get; set; }
        public int? CitationsCount { get; set; }
        public bool? IsPublic { get; set; }
        public int? CurrentWorkVersionId { get; set; }
        public WorkMetadataNew? WorkMetadata { get; set; }
        public FileLocation? FileLocation { get; set; }
        public ICollection<WorkUser> WorkUsers { get; set; } = new List<WorkUser>();
        public List<UserSmallDTO> Users { get; set; } = new List<UserSmallDTO>();
    }
}