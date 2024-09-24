
using System.Text.Json.Serialization;

namespace sciencehub_backend_community.Features.Chats.Models
{
    public class ChatUsersData
    {
        [JsonPropertyName("chatUsers")]
        public List<ChatUser>? ChatUsers { get; set; }
    }

    public class ChatUser 
    {
        [JsonPropertyName("chatId")]
        public int ChatId { get; set; }

        [JsonPropertyName("userId")]
        public int UserId { get; set; }

        [JsonPropertyName("username")]
        public string? Role { get; set; }
    }
}