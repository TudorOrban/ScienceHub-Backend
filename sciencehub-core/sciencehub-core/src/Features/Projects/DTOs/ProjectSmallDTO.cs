namespace sciencehub_backend_core.Features.Projects.DTOs
{
    public class ProjectSmallDTO
    {
        public int Id { get; set; }
        public string Title { get; set; } = string.Empty;
        public string Name { get; set; } = string.Empty;
        public string? CreatedAt { get; set; }
    }
}