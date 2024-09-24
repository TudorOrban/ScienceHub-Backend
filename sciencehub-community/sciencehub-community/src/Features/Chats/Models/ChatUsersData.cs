
using System.Text.Json.Serialization;
using sciencehub_community.Core.Users.Models;

namespace sciencehub_community.Features.Chats.Models
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

        [JsonPropertyName("role")]
        public string? Role { get; set; }

        [JsonPropertyName("user")]
        public UserSmallDTO? User { get; set; }
    }
}