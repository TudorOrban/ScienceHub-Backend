using sciencehub_backend_community.Core.Users.Models;

namespace sciencehub_backend_community.Features.Discussions.DTOs
{
    public class MessageSearchDTO
    {
        public string Id { get; set; } = string.Empty;
        public string UserId { get; set; } = string.Empty;
        public int ChatId { get; set; }
        public User? user { get; set; }
        public DateTime? CreatedAt { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public string? Content { get; set; }
        public List<MessageSearchDTO>? Messages { get; set; }
    }
}