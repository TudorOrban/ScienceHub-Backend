﻿using System.ComponentModel.DataAnnotations.Schema;
using sciencehub_core.Core.Users.Models;

namespace sciencehub_core.Features.Submissions.Models
{
    public class WorkSubmissionUser
    {
        [ForeignKey("WorkSubmission")]
        [Column("work_submission_id")]
        public int WorkSubmissionId { get; set; }

        [ForeignKey("User")]
        [Column("user_id")]
        public int UserId { get; set; }

        public WorkSubmission WorkSubmission { get; set; }
        public User User { get; set; }
    }
}
