using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using sciencehub_core.Shared.Enums;

namespace sciencehub_core.Features.Issues.Models
{
    [Table("issues")]
    public class Issue
    {
        [Key]
        [Column("id")]
        public int Id { get; set; }

        [Column("issue_type")]
        public IssueType IssueType { get; set; }

        [Column("project_id")]
        public int? ProjectId { get; set; }

        [Column("work_id")]
        public int? WorkId { get; set; }

        [Column("work_type")]
        public WorkType? WorkType { get; set; }

        [Column("title")]
        public string Title { get; set; } = string.Empty;

        [Column("name")]
        public string Name { get; set; } = string.Empty;

        [Column("description")]
        public string? Description  { get; set; }

        [Column("created_at")]
        public DateTime CreatedAt { get; set; }
        
        [Column("status")]
        public IssueStatus? Status { get; set; }

        [Column("is_public")]
        public bool? IsPublic { get; set; }
        
        [Column("total_upvotes")]
        public int? TotalUpvotes { get; set; }

        public ICollection<IssueUser> IssueUsers { get; set; } = new List<IssueUser>();
    }
}