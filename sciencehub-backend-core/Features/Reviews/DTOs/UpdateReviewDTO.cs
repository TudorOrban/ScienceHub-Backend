using System.ComponentModel.DataAnnotations;

namespace sciencehub_backend_core.Features.Reviews.DTOs
{
    public class UpdateReviewDTO : IValidatableObject
    {
        [Required(ErrorMessage = "ID is required.")]
        public int Id { get; set; }

        [Required(ErrorMessage = "Review Type is required.")]
        public string ReviewObjectType { get; set; } = string.Empty;

        public int? ProjectId { get; set; }

        public string? WorkType { get; set; }

        public int? WorkId { get; set; }

        [Required(ErrorMessage = "Title is required.")]
        [StringLength(100, ErrorMessage = "Title must be less than 100 characters long.")]
        public string Title { get; set; }

        public string? Description { get; set; }

        [Required(ErrorMessage = "At least one user is required.")]
        [MinLength(1, ErrorMessage = "At least one user is required.")]
        public List<string> Users { get; set; }

        public bool? IsPublic { get; set; }

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