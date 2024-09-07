﻿using System.ComponentModel.DataAnnotations;

namespace sciencehub_backend_core.Features.Submissions.DTO
{
    public class CreateSubmissionDTO : IValidatableObject
    {
        [Required(ErrorMessage = "Submission Object Type is required.")]
        public string SubmissionObjectType { get; set; }

        // Nullable to handle the case when ProjectId is not provided
        public int? ProjectId { get; set; }

        public string? WorkType { get; set; }

        public int? WorkId { get; set; }

        public int? ProjectSubmissionId { get; set; }

        [Required(ErrorMessage = "Title is required.")]
        [StringLength(100, ErrorMessage = "Title must be less than 100 characters long.")]
        public string Title { get; set; }

        public string? Description { get; set; }

        public int? InitialProjectVersionId { get; set; }

        public int? InitialWorkVersionId { get; set; }

        [Required(ErrorMessage = "At least one user is required.")]
        [MinLength(1, ErrorMessage = "At least one user is required.")]
        public List<string> Users { get; set; }

        public bool Public { get; set; }

        public IEnumerable<ValidationResult> Validate(ValidationContext validationContext)
        {
            if (SubmissionObjectType == "Work")
            {
                if (string.IsNullOrEmpty(WorkType))
                {
                    yield return new ValidationResult("Work Type is required", new[] { "WorkType" });
                }
                if (!WorkId.HasValue || WorkId.Value == 0)
                {
                    yield return new ValidationResult("Work Id is required", new[] { "WorkId" });
                }
                if (!InitialWorkVersionId.HasValue)
                {
                    yield return new ValidationResult("Initial Work Version is required", new[] { "InitialWorkVersionId" });
                }
            }

            if (SubmissionObjectType == "Project")
            {
                if (!ProjectId.HasValue || ProjectId.Value == 0)
                {
                    yield return new ValidationResult("Project is required", new[] { "ProjectId" });
                }
                if (!InitialProjectVersionId.HasValue)
                {
                    yield return new ValidationResult("Initial Project Version is required", new[] { "InitialProjectVersionId" });
                }
            }
        }
    }
}
