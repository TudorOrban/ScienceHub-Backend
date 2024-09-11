using System.ComponentModel.DataAnnotations;

namespace sciencehub_backend_core.Features.Reviews.DTOs
{
    public class CreateReviewDTO : IValidatableObject
    {
        [Required(ErrorMessage = "Review Type is required.")]
        public string ReviewObjectType { get; set; } = string.Empty;

        public int? ProjectId { get; set; }

        public string? WorkType { get; set; }

        public int? WorkId { get; set; }

        [Required(ErrorMessage = "Title is required.")]
        [StringLength(100, ErrorMessage = "Title must be less than 100 characters long.")]
        public string Title { get; set; } = string.Empty;

        [Required(ErrorMessage = "Name is required.")]
        [StringLength(50, ErrorMessage = "Name must be less than 50 characters long.")]
        public string Name { get; set; } = string.Empty;

        public string? Description { get; set; }

        public bool? IsPublic { get; set; }

        [Required(ErrorMessage = "At least one user is required.")]
        [MinLength(1, ErrorMessage = "At least one user is required.")]
        public List<string> Users { get; set; } = new List<string>();

        public IEnumerable<ValidationResult> Validate(ValidationContext validationContext)
        {
            if (ReviewObjectType == "Work")
            {
                if (string.IsNullOrEmpty(WorkType))
                {
                    yield return new ValidationResult("Work Type is required", ["WorkType"]);
                }
                if (!WorkId.HasValue || WorkId.Value == 0)
                {
                    yield return new ValidationResult("Work Id is required", ["WorkId"]);
                }
            }

            if (ReviewObjectType == "Project" && (!ProjectId.HasValue || ProjectId.Value == 0))
            {
                yield return new ValidationResult("Project is required", ["ProjectId"]);
            }
        }
    }
}