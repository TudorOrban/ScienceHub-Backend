using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using sciencehub_community.Core.Users.Models;

namespace sciencehub_community.Features.Discussions.Models
{
    [Table("discussion_comments")]
    public  class Comment
    {
        [Key]
        [Column("id")]
        public string Id { get; set; } = string.Empty;

        [Column("user_id")]
        public string UserId { get; set; } = string.Empty;

        [Column("discussion_id")]
        public int DiscussionId { get; set; }

        [NotMapped] 
        public User? users { get; set; }

        [Column("created_at")]
        public DateTime CreatedAt { get; set; }

        [Column("updated_at")]
        public DateTime UpdatedAt { get; set; }

        [Column("parent_comment_id")]
        public int? ParentCommentId { get; set; }

        [Column("title")]
        public string? Title { get; set; }
        
        [Column("content")]
        public string? Content { get; set; }

        [Column("total_comments")]
        public int? TotalComments { get; set; }

        [Column("total_upvotes")]
        public int? TotalUpvotes { get; set; }
        
        [Column("total_shares")]
        public int? TotalShares { get; set; }

        [Column("total_views")]
        public int? TotalViews { get; set; }

        [NotMapped] 
        public List<Comment>? Comments { get; set; }

        [Column("is_public")]
        public bool IsPublic { get; set; } = true;
    }
}