﻿using System.ComponentModel.DataAnnotations.Schema;
using sciencehub_core.Core.Users.Models;

namespace sciencehub_core.Features.Submissions.Models
{
    public class ProjectSubmissionUser
    {
        [ForeignKey("ProjectSubmission")]
        [Column("project_submission_id")]
        public int ProjectSubmissionId { get; set; }

        [ForeignKey("User")]
        [Column("user_id")]
        public int UserId { get; set; }

        public ProjectSubmission ProjectSubmission { get; set; }
        public User User { get; set; }
    }
}
