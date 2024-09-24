using System.ComponentModel.DataAnnotations.Schema;
using sciencehub_core.Core.Users.Models;

namespace sciencehub_core.Features.Reviews.Models
{
    public class ReviewUser
    {
        [ForeignKey("Review")]
        [Column("review_id")]
        public int ReviewId { get; set; }

        [ForeignKey("User")]
        [Column("user_id")]
        public int UserId { get; set; }

        public Review Review { get; set; }
        public User User { get; set; }
    }
}
