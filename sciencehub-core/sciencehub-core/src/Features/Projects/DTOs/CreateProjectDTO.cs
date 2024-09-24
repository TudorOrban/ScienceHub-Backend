using System.ComponentModel.DataAnnotations;

namespace sciencehub_core.Features.Projects.DTOs
{
    public class CreateProjectDTO
    {
        [Required(ErrorMessage = "Title is required.")]
        [StringLength(100, ErrorMessage = "Title must be less than 100 characters long.")]
        public string Title { get; set; } = string.Empty;

        [Required(ErrorMessage = "Name is required.")]
        [StringLength(100, ErrorMessage = "Name must be less than 100 characters long.")]
        [RegularExpression(@"^[^\\/~]*$", ErrorMessage = "The name cannot contain backslashes, slashes or tildes")]
        public string Name { get; set; } = string.Empty;

        public string? Description { get; set; }

        [Required(ErrorMessage = "At least one user is required.")]
        public List<string> Users { get; set; } = new List<string>();

        public bool IsPublic { get; set; }
    }
}
