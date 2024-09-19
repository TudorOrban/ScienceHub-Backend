
using sciencehub_backend_core.Core.Users.DTOs;
using sciencehub_backend_core.Shared.Search;

namespace sciencehub_backend_core.Core.Users.Services
{
    public interface IUserService
    {
        Task<PaginatedResults<UserSmallDTO>> searchUsersByUsernameAsync(
            SearchParams searchParams
        );
        Task<UserSmallDTO> GetUserSmallByIdAsync(int id);
        Task<UserDetailsDTO> GetUserDetailsByIdAsync(int id);
        Task<List<UserSmallDTO>> GetUsersByIdsAsync(List<int> userIds);
        Task<List<UserSmallDTO>> GetUsersByUsernamesAsync(List<string> usernames);
    }
}