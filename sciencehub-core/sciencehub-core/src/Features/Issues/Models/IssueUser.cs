using System.ComponentModel.DataAnnotations.Schema;
using sciencehub_core.Core.Users.Models;

namespace sciencehub_core.Features.Issues.Models
{
    public class IssueUser
    {
        [ForeignKey("Issue")]
        [Column("issue_id")]
        public int IssueId { get; set; }

        [ForeignKey("User")]
        [Column("user_id")]
        public int UserId { get; set; }

        public Issue Issue { get; set; }
        public User User { get; set; }
    }
}
