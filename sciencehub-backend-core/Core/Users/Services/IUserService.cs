
using sciencehub_backend_core.Core.Users.DTOs;

namespace sciencehub_backend_core.Core.Users.Services
{
    public interface IUserService
    {
        Task<UserSmallDTO> GetUserSmallByIdAsync(int id);
        Task<UserDetailsDTO> GetUserDetailsByIdAsync(int id);
        Task<List<UserSmallDTO>> GetUsersByIdsAsync(List<int> userIds);
        Task<List<UserSmallDTO>> GetUsersByUsernamesAsync(List<string> usernames);
    }
}