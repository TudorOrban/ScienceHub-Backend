using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using sciencehub_backend_community.Core.Users.Models;

namespace sciencehub_backend_community.Features.Discussions.Models
{
    [Table("discussions")]
    public class Discussion
    {
        [Key]
        [Column("id")]
        public long Id { get; set; }

        [Column("user_id")]
        public int UserId { get; set; }

        [NotMapped] 
        public User? User { get; set; }
        
        [Column("created_at")]
        public DateTime? CreatedAt { get; set; }

        [Column("updated_at")]
        public DateTime? UpdatedAt { get; set; }

        [Column("title")]
        public string Title { get; set; } = string.Empty;

        [Column("content")]
        public string? Content { get; set; }

        [Column("total_upvotes")]
        public int? TotalUpvotes { get; set; }
        
        [Column("total_shares")]
        public int? TotalShares { get; set; }

        [Column("total_views")]
        public int? TotalViews { get; set; }

        [Column("is_public")]
        public bool? IsPublic { get; set; }

        [NotMapped] 
        public List<Comment>? DiscussionComments { get; set; }
    }
}