
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using sciencehub_backend_community.Shared.Serialization;

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

        private CustomJsonSerializer _serializer = new CustomJsonSerializer();

        [Column("users", TypeName = "jsonb")]
        public string? UsersDataJson { get; set; }

        private ChatUsersData? _cachedUsersData = null;

        [NotMapped]
        public ChatUsersData UsersData
        {
            get => _cachedUsersData ??= _serializer.DeserializeFromJson<ChatUsersData>(UsersDataJson ?? "{}");
            set
            {
                _cachedUsersData = value;
                UsersDataJson = _serializer.SerializeToJson(value);
            }
        }
    }
    
}