using sciencehub_core.Core.Users.DTOs;
using sciencehub_core.Features.Submissions.VersionControlSystem.Models;
using sciencehub_core.Features.Works.Models;
using sciencehub_core.Shared.Enums;

namespace sciencehub_core.Features.Works.DTOs
{
    public class WorkDetailsDTO
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