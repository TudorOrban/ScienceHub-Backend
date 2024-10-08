﻿
using sciencehub_core.Core.Users.DTOs;

namespace sciencehub_core.Features.Projects.DTOs
{
    public class ProjectSearchDTO
    {
        public int Id { get; set; }
        public string Name { get; set; } = string.Empty;
        public string Title { get; set; } = string.Empty;
        public string? Description { get; set; }
        public List<ProjectUserDTO> ProjectUsers { get; set; } = new List<ProjectUserDTO>();
        public List<UserSmallDTO> Users { get; set; } = new List<UserSmallDTO>();

    }

    public class ProjectUserDTO
    {
        public int ProjectId { get; set; }
        public int UserId { get; set; }
        public string Role { get; set; } = string.Empty;
        public UserDTO? User { get; set; }
    }

    public class UserDTO
    {
        public int Id { get; set; }
        public string Username { get; set; } = string.Empty;
        public string? FullName { get; set; }
    }
}