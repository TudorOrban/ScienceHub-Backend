using NpgsqlTypes;

namespace sciencehub_core.Shared.Enums
{
    public enum WorkType
    {
        [PgName("Paper")]
        Paper,

        [PgName("Experiment")]
        Experiment,

        [PgName("Dataset")]
        Dataset,

        [PgName("DataAnalysis")]
        DataAnalysis,

        [PgName("AIModel")]
        AIModel,

        [PgName("CodeBlock")]
        CodeBlock,
    }
}
