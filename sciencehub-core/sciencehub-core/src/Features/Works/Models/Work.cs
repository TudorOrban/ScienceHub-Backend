using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using sciencehub_backend_core.Features.Submissions.VersionControlSystem.Models;
using sciencehub_backend_core.Shared.Enums;
using sciencehub_backend_core.Shared.Serialization;

namespace sciencehub_backend_core.Features.Works.Models
{
    [Table("works")]
    public class Work
    {
        [Key]
        [Column("id")]
        public int Id { get; set; }

        [Column("work_type")]
        public WorkType WorkType { get; set; }

        [Column("project_id")]
        public int? ProjectId { get; set; }

        [Required]
        [Column("name")]
        public string Name { get; set; } = string.Empty;

        [Required]
        [Column("title")]
        public string Title { get; set; } = string.Empty;

        [Column("description")]
        public string? Description { get; set; }

        [Column("created_at")]
        public DateTime CreatedAt { get; set; }

        [Column("updated_at")]
        public DateTime UpdatedAt { get; set; }

        [Column("research_score")]
        public float? ResearchScore { get; set; }

        [Column("total_citations")]
        public int? TotalCitations { get; set; }

        [Column("total_upvotes")]
        public int? TotalUpvotes { get; set; }

        [Column("is_public")]
        public bool? IsPublic { get; set; }

        [Column("current_work_version_id")]
        public int? CurrentWorkVersionId { get; set; }

        private CustomJsonSerializer _serializer = new CustomJsonSerializer();

        [Column("work_metadata", TypeName = "jsonb")]
        public string? WorkMetadataJson { get; set; } = "{}";

        private WorkMetadataNew? _cachedWorkMetadata = null;

        [NotMapped]
        public WorkMetadataNew WorkMetadata
        {
            get => _cachedWorkMetadata ??= _serializer.DeserializeFromJson<WorkMetadataNew>(WorkMetadataJson ?? "{}");
            set
            {
                _cachedWorkMetadata = value;
                WorkMetadataJson = _serializer.SerializeToJson(value);
            }
        }

        [Column("file_location", TypeName = "jsonb")]
        public string? FileLocationJson { get; set; }

        private FileLocation? _cachedFileLocation = null;

        [NotMapped]
        public FileLocation FileLocation
        {
            get => _cachedFileLocation ??= _serializer.DeserializeFromJson<FileLocation>(FileLocationJson ?? "{}");
            set
            {
                _cachedFileLocation = value;
                FileLocationJson = _serializer.SerializeToJson(value);
            }
        }
        
        public ICollection<WorkUser> WorkUsers { get; set; } = new List<WorkUser>();
    }
}