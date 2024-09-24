using sciencehub_community.Core.Users.Models;

namespace sciencehub_community.Features.Discussions.DTOs
{
    public class CommentSearchDTO
    {
        public string Id { get; set; } = string.Empty;
        public string UserId { get; set; } = string.Empty;
        public int DiscussionId { get; set; }
        public User? users { get; set; }
        public DateTime? CreatedAt { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public int? ParentCommentId { get; set; }
        public string? Content { get; set; }
        public int? ChildrenCommentsCount { get; set; }
        public int? CommentRepostsCount { get; set; }
        public int? CommentBookmarksCount { get; set; }
        public List<CommentSearchDTO>? Comments { get; set; }
    }
}