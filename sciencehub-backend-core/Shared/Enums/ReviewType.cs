using NpgsqlTypes;

namespace sciencehub_backend_core.Shared.Enums
{
    public enum ReviewType
    {
        [PgName("ProjectReview")]
        ProjectReview,

        [PgName("WorkReview")]
        WorkReview,
    }
}
