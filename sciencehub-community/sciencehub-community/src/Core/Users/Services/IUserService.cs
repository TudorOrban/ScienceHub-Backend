using sciencehub_community.Core.Users.Models;

namespace sciencehub_community.Core.Users.Services
{
    public interface IUserService
    {
        Task<List<UserSmallDTO>> GetUsersByIdsAsync(List<int> userIds);
    }
}