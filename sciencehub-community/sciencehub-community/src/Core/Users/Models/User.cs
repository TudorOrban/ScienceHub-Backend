namespace sciencehub_community.Core.Users.Models
{
    public class User 
    {
        public int Id { get; set; }
        public string Username { get; set; } = string.Empty;
        public string? FullName { get; set; }
    }
}