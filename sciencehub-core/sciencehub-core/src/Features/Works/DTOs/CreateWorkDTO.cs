﻿using System.ComponentModel.DataAnnotations;

namespace sciencehub_core.Features.Works.DTOs
{
    public class CreateWorkDTO
    {
        [Required(ErrorMessage = "Work Type is required.")]
        public string WorkType { get; set; } = string.Empty;

        public int? ProjectId { get; set; }
        public int? SubmissionId { get; set; }

        [Required(ErrorMessage = "Title is required.")]
        [StringLength(100, ErrorMessage = "Title must be less than 100 characters long.")]
        public string Title { get; set; } = string.Empty;

        [Required(ErrorMessage = "Name is required.")]
        [StringLength(50, ErrorMessage = "Name must be less than 50 characters long.")]
        public string Name { get; set; } = string.Empty;

        public string? Description { get; set; }

        [Required(ErrorMessage = "At least one user is required.")]
        public List<string> Users { get; set; } = new List<string>();

        public bool IsPublic { get; set; }
    }
}
