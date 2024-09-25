using sciencehub_community.Core.Users.Models;

namespace sciencehub_community.Features.Chats.DTOs
{
    public class ChatMessageSearchDTO
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public int ChatId { get; set; }
        public UserSmallDTO? User { get; set; }
        public DateTime? CreatedAt { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public string? Content { get; set; }
    }
}