namespace sciencehub_backend_community.Core.Users.Models
{
    public class UserSmallDTO
    {
        public int Id { get; set; }
        public string Username { get; set; } = string.Empty;
        public string? FullName { get; set; }
        public string? CreatedAt { get; set; }
        public string? AvatarUrl { get; set; }
    }
}