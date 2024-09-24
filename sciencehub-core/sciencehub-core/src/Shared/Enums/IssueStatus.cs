using NpgsqlTypes;
using System.ComponentModel;

namespace sciencehub_backend_core.Shared.Enums
{
    public enum IssueStatus
    {
        [PgName("Open")]
        Opened,

        [PgName("Closed")]
        Closed,
    }
}
