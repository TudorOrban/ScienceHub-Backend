using sciencehub_core.Features.Works.Models;
using sciencehub_core.Shared.Serialization;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace sciencehub_core.Features.Projects.Models
{
    [Table("projects")]
    public class Project
    {
        [Key]
        [Column("id")]
        public int Id { get; set; }

        [Column("name")]
        public string Name { get; set; } = string.Empty;

        [Column("title")]
        public string Title { get; set; } = string.Empty;

        [Column("description")]
        public string? Description { get; set; }

        [Column("created_at")]
        public DateTime CreatedAt { get; set; }

        [Column("updated_at")]
        public DateTime UpdatedAt { get; set; }

        [Column("research_score")]
        public int? ResearchScore { get; set; }

        [Column("h_index")]
        public int? HIndex { get; set; }

        [Column("total_citations")]
        public int? TotalCitations { get; set; }

        [Column("is_public")]
        public bool? IsPublic { get; set; }

        [Column("current_project_version_id")]
        public int? CurrentProjectVersionId { get; set; }
        
        private CustomJsonSerializer _serializer = new CustomJsonSerializer();

        [Column("project_metadata", TypeName = "jsonb")]
        public string? ProjectMetadataJson { get; set; }

        private ProjectMetadata? _cachedProjectMetadata = null;

        [NotMapped]
        public ProjectMetadata ProjectMetadata
        {
            get => _cachedProjectMetadata ??= _serializer.DeserializeFromJson<ProjectMetadata>(ProjectMetadataJson ?? "{}");
            set
            {
                _cachedProjectMetadata = value;
                ProjectMetadataJson = _serializer.SerializeToJson(value);
            }
        }

        public ICollection<ProjectUser> ProjectUsers { get; set; } = new List<ProjectUser>();
    }
}
