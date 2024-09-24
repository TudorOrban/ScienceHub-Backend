using sciencehub_community.Core.Users.Models;
using sciencehub_community.Features.Discussions.Models;

namespace sciencehub_community.Features.Discussions.DTOs
{
    public class DiscussionSearchDTO
    {
        public long Id { get; set; }
        public int UserId { get; set; }
        public UserSmallDTO? User { get; set; }
        public DateTime? CreatedAt { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public string Title { get; set; } = string.Empty;
        public string? Content { get; set; }
        public int? TotalUpvotes { get; set; }
        public int? TotalShares { get; set; }
        public int? TotalViews { get; set; }
        public bool? IsPublic { get; set; }
        public List<Comment>? DiscussionComments { get; set; }
    }
}