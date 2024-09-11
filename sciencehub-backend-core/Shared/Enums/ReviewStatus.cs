using NpgsqlTypes;
using System.ComponentModel;

namespace sciencehub_backend_core.Shared.Enums
{
    public enum ReviewStatus
    {
        [PgName("InProgress")]
        InProgress,

        [PgName("Submitted")]
        Submitted,
    }
}
