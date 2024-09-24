using System.ComponentModel.DataAnnotations.Schema;
using sciencehub_core.Core.Users.Models;

namespace sciencehub_core.Features.Works.Models
{
    public class WorkUser
    {
        [ForeignKey("Work")]
        [Column("work_id")]
        public int WorkId { get; set; }

        [ForeignKey("User")]
        [Column("user_id")]
        public int UserId { get; set; }

        [Column("role")]
        public string? Role;
        
        public Work Work { get; set; }
        public User User { get; set; }
    }

}