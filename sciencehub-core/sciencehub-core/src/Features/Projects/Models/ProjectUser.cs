using sciencehub_core.Core.Users.Models;
using sciencehub_core.Features.Projects.Models;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace sciencehub_core.Features.Projects.Models
{
    public class ProjectUser
    {
        [ForeignKey("Project")]
        [Column("project_id")]
        public int ProjectId { get; set; }

        [ForeignKey("User")]
        [Column("user_id")]
        public int UserId { get; set; }

        [Column("role")]
        public string Role { get; set; }

        [JsonIgnore]
        public Project Project { get; set; }
        [JsonIgnore]
        public User User { get; set; }
    }
}