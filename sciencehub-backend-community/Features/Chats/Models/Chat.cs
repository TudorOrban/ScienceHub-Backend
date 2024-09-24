
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace sciencehub_backend_community.Features.Chats.Models
{
    [Table("chats")]
    public class Chat
    {
        [Key]
        [Column("id")]
        public int Id { get; set; }

        [Column("created_at")]
        public DateTime CreatedAt { get; set; }

        [Column("updated_at")]
        public DateTime UpdatedAt { get; set; }

        [Column("title")]
        public string? Title { get; set; }

        [Column("content")]
        public string? Content { get; set; }

        [Column("is_public")]
        public bool? IsPublic { get; set; }

        public List<ChatMessage>? ChatMessages { get; set; }

        public ChatUsersData Users { get; set; } = new ChatUsersData();
    }
    
}