namespace sciencehub_backend_core.Core.Users.Models
{
    public class UserDetails
    {
        public string[]? Qualifications { get; set; }
        public string[]? Affiliations { get; set; }
        public string[]? ResearchInterests { get; set; }
        public string[]? FielsOfResearch { get; set; }
        public string[]? Education { get; set; }
        public string[]? ContactInformation { get; set; }
        public string[]? SocialMediaLinks { get; set; }
        public string? Location { get; set; }
        public string? Status { get; set; }
    }
}