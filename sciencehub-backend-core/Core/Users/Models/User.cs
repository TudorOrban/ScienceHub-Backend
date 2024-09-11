using sciencehub_backend_core.Features.Issues.Models;
using sciencehub_backend_core.Features.Projects.Models;
using sciencehub_backend_core.Features.Reviews.Models;
using sciencehub_backend_core.Features.Submissions.Models;
using sciencehub_backend_core.Features.Works.Models;

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace sciencehub_backend_core.Core.Users.Models
{
    [Table("users")]
    public class User
    {
        [Key]
        [Column("id")]
        public int Id { get; set; }

        [Column("username")]
        public string Username { get; set; } = string.Empty;

        [Column("email")]
        public string Email { get; set; } = string.Empty;

        [Column("full_name")]
        public string? FullName { get; set; }

        [Column("created_at")]
        public DateTime? CreatedAt { get; set; }

        [Column("updated_at")]
        public DateTime? UpdatedAt { get; set; }

        [Column("is_verified")]
        public bool IsVerified { get; set; }

        [Column("avatar_url")]
        public string? AvatarUrl { get; set; }

        [Column("bio")]
        public string? Bio { get; set; }

        [Column("research_score")]
        public double? ResearchScore { get; set; }

        [Column("h_index")]
        public int? HIndex { get; set; }

        [Column("total_citations")]
        public int? TotalCitations { get; set; }

        [Column("total_upvotes")]
        public int? TotalUpvotes { get; set; }

        public ICollection<ProjectUser> ProjectUsers { get; set; } = new List<ProjectUser>();
        public ICollection<WorkUser> WorkUsers { get; set; } = new List<WorkUser>();
        public ICollection<ProjectSubmissionUser> ProjectSubmissionUsers { get; set; } = new List<ProjectSubmissionUser>();
        public ICollection<WorkSubmissionUser> WorkSubmissionUsers { get; set; } = new List<WorkSubmissionUser>();
        public ICollection<IssueUser> IssueUsers { get; set; } = new List<IssueUser>();
        public ICollection<ProjectIssueUser> ProjectIssueUsers { get; set; } = new List<ProjectIssueUser>();
        public ICollection<WorkIssueUser> WorkIssueUsers { get; set; } = new List<WorkIssueUser>();
        public ICollection<ProjectReviewUser> ProjectReviewUsers { get; set; } = new List<ProjectReviewUser>();
        public ICollection<WorkReviewUser> WorkReviewUsers { get; set; } = new List<WorkReviewUser>();
    }
}
