using NpgsqlTypes;

namespace sciencehub_core.Shared.Enums
{
    public enum IssueType
    {
        [PgName("ProjectIssue")]
        ProjectIssue,

        [PgName("WorkIssue")]
        WorkIssue,
    }
}
