﻿using NpgsqlTypes;
using System.ComponentModel;

namespace sciencehub_core.Shared.Enums
{
    public enum SubmissionStatus
    {
        [PgName("In progress")]
        InProgress,

        [PgName("Submitted")]
        Submitted,

        [PgName("Accepted")]
        Accepted
    }
}
