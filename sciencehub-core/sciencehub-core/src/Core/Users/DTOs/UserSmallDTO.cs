namespace sciencehub_core.Core.Users.DTOs
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