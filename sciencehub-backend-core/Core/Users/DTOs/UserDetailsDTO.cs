using sciencehub_backend_core.Core.Users.Models;

namespace sciencehub_backend_core.Core.Users.DTOs
{
    public class UserDetailsDTO
    {
        public int Id { get; set; }
        public string Username { get; set; } = string.Empty;
        public string? FullName { get; set; }
        public string? CreatedAt { get; set; }
        public string? AvatarUrl { get; set; }
        public UserDetails? UserDetails { get; set; }
    }
}