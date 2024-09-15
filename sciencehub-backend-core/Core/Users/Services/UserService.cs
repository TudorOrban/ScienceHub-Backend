using sciencehub_backend_core.Data;
using Microsoft.EntityFrameworkCore;
using sciencehub_backend_core.Core.Users.DTOs;
using sciencehub_backend_core.Exceptions.Errors;
using sciencehub_backend_core.Core.Users.Models;

namespace sciencehub_backend_core.Core.Users.Services
{
    public class UserService : IUserService
    {
        private readonly CoreServiceDbContext _context;
        private readonly ILogger<UserService> _logger;

        public UserService(CoreServiceDbContext context, ILogger<UserService> logger)
        {
            _context = context;
            _logger = logger;
        }

        public async Task<UserSmallDTO> GetUserSmallByIdAsync(int id)
        {
            var user = await _context.Users
                .Where(u => u.Id == id)
                .Select(u => mapUserToUserSmallDTO(u))
                .FirstOrDefaultAsync();
            if (user == null)
            {
                throw new ResourceNotFoundException("User", id.ToString());
            }
            return user;
        }

        public async Task<UserDetailsDTO> GetUserDetailsByIdAsync(int id)
        {
            var user = await _context.Users
                .Where(u => u.Id == id)
                .Select(u => new UserDetailsDTO
                {
                    Id = u.Id,
                    Username = u.Username,
                    FullName = u.FullName,
                    CreatedAt = u.CreatedAt.HasValue ? u.CreatedAt.Value.ToString("yyyy-MM-dd HH:mm:ss") : null,
                    AvatarUrl = u.AvatarUrl,
                    UserDetails = u.UserDetails,
                })
                .FirstOrDefaultAsync();

            if (user == null)
            {
                throw new ResourceNotFoundException("User", id.ToString());
            }

            return user;
        }

        public async Task<List<UserSmallDTO>> GetUsersByIdsAsync(List<int> userIds)
        {
            var users = await _context.Users.Where(u => userIds.Contains(u.Id))
                .Select(u => mapUserToUserSmallDTO(u))
                .ToListAsync();
            if (users == null)
            {
                throw new Exception("Failed to fetch users");
            }
            return users;
        }

        public async Task<List<UserSmallDTO>> GetUsersByUsernamesAsync(List<string> usernames)
        {
            var users = await _context.Users.Where(u => usernames.Contains(u.Username))
                .Select(u => mapUserToUserSmallDTO(u))
                .ToListAsync();
            if (users == null)
            {
                throw new Exception("Failed to fetch users");
            }
            return users;
        }

        private static UserSmallDTO mapUserToUserSmallDTO(User user)
        {
            return new UserSmallDTO
            {
                Id = user.Id,
                Username = user.Username,
                FullName = user.FullName,
                CreatedAt = user.CreatedAt.HasValue ? user.CreatedAt.Value.ToString("yyyy-MM-dd HH:mm:ss") : null,
                AvatarUrl = user.AvatarUrl
            };
        }
    }
}