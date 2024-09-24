﻿using sciencehub_core.Shared.Enums;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace sciencehub_core.Features.Submissions.VersionControlSystem.Models
{
    [Table("work_versions")]
    public class WorkVersion
    {
        [Key]
        [Column("id")]
        public int Id { get; set; }

        [Column("work_id")]
        public int WorkId { get; set; }

        [Column("work_type")]
        public WorkType WorkType { get; set; }
    }
}
