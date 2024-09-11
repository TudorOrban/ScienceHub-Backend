using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using sciencehub_backend_core.Shared.Enums;

namespace sciencehub_backend_core.Features.Reviews.Models
{
    [Table("reviews")]
    public class Review
    {
        [Key]
        [Column("id")]
        public int Id { get; set; }

        [Column("review_type")]
        public ReviewType ReviewType { get; set; }

        [Column("project_id")]
        public int? ProjectId { get; set; }

        [Column("work_id")]
        public int? WorkId { get; set; }

        [Column("work_type")]
        public WorkType? WorkType { get; set; }

        [Column("title")]
        public string Title { get; set; } = string.Empty;

        [Column("description")]
        public string? Description  { get; set; }

        [Column("created_at")]
        public DateTime CreatedAt { get; set; }
        
        [Column("status")]
        public ReviewStatus? Status { get; set; }

        [Column("is_public")]
        public bool? IsPublic { get; set; }
        
        [Column("total_upvotes")]
        public int? TotalUpvotes { get; set; }

        public ICollection<ReviewUser> ReviewUsers { get; set; } = new List<ReviewUser>();
    }
}