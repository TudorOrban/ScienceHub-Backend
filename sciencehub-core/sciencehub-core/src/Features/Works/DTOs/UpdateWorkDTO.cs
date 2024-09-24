using System.ComponentModel.DataAnnotations;

namespace sciencehub_core.Features.Works.DTOs
{
    public class UpdateWorkDTO
    {
        [Required]
        public int Id { get; set; }
        public string WorkType { get; set; } = string.Empty;

        public int? ProjectId { get; set; }
        public int? SubmissionId { get; set; }

        [StringLength(100, ErrorMessage = "Title must be less than 100 characters long.")]
        public string Title { get; set; } = string.Empty;

        [Required(ErrorMessage = "Name is required.")]
        [StringLength(50, ErrorMessage = "Name must be less than 50 characters long.")]
        public string Name { get; set; } = string.Empty;
        
        public string? Description { get; set; }

        public List<string> Users { get; set; } = new List<string>();

        public bool IsPublic { get; set; }
    }
}
