namespace sciencehub_backend_community.Features.Chats.Models
{
    public class ChatUsersData
    {
        public List<ChatUser>? ChatUsers { get; set; }
    }

    public class ChatUser 
    {
        public int ChatId { get; set; }
        public int UserId { get; set; }
        public string? Role { get; set; }
    }
}