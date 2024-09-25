using sciencehub_community.Core.Users.Models;
using sciencehub_community.Features.Chats.Models;

namespace sciencehub_community.Features.Chats.DTOs
{
    public class ChatSearchDTO
    {
        public long Id { get; set; }
        public ChatUsersData? ChatUsersData { get; set; }
        public List<ChatUserDTO>? ChatUsers { get; set; }
        public DateTime? CreatedAt { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public string? Title { get; set; } = string.Empty;
        public string? Content { get; set; }
        public bool? IsPublic { get; set; }
        public List<ChatMessage>? ChatMessages { get; set; }
    }
}