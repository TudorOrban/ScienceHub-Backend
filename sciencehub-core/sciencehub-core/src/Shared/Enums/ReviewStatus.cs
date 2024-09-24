using NpgsqlTypes;
using System.ComponentModel;

namespace sciencehub_core.Shared.Enums
{
    public enum ReviewStatus
    {
        [PgName("InProgress")]
        InProgress,

        [PgName("Submitted")]
        Submitted,
    }
}
