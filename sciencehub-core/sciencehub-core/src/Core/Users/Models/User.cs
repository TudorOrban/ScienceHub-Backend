using sciencehub_backend_core.Features.Issues.Models;
using sciencehub_backend_core.Features.Projects.Models;
using sciencehub_backend_core.Features.Reviews.Models;
using sciencehub_backend_core.Features.Submissions.Models;
using sciencehub_backend_core.Features.Works.Models;
using sciencehub_backend_core.Shared.Serialization;
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

        [Column("is_profile_public")]
        public bool? IsProfilePublic { get; set; }

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

        private CustomJsonSerializer _serializer = new CustomJsonSerializer();

        // Custom (de)serialization and caching of jsonb columns
        [Column("user_details", TypeName = "jsonb")]
        public string? UserDetailsJson { get; set; } = "{}";

        private UserDetails? _cachedUserDetails;

        [NotMapped]
        public UserDetails UserDetails
        {
            get => _cachedUserDetails ??= _serializer.DeserializeFromJson<UserDetails>(UserDetailsJson ?? "{}");
            set
            {
                _cachedUserDetails = value;
                UserDetailsJson = _serializer.SerializeToJson(value);
            }
        }

        public ICollection<ProjectUser> ProjectUsers { get; set; } = new List<ProjectUser>();
        public ICollection<WorkUser> WorkUsers { get; set; } = new List<WorkUser>();
        public ICollection<ProjectSubmissionUser> ProjectSubmissionUsers { get; set; } = new List<ProjectSubmissionUser>();
        public ICollection<WorkSubmissionUser> WorkSubmissionUsers { get; set; } = new List<WorkSubmissionUser>();
        public ICollection<IssueUser> IssueUsers { get; set; } = new List<IssueUser>();
        public ICollection<ReviewUser> ReviewUsers { get; set; } = new List<ReviewUser>();
    }
}
