using sciencehub_backend_core.Core.Users.Services;

using Microsoft.AspNetCore.Mvc;
using sciencehub_backend_core.Core.Users.DTOs;

namespace sciencehub_backend_core.Core.Users.Controllers
{
    [ApiController]
    [Route("api/v1/users")]
    public class UserController : ControllerBase
    {
        private readonly IUserService _userService;

        public UserController(IUserService userService)
        {
            _userService = userService;
        }

        [HttpGet("{id}/small")]
        public async Task<ActionResult<UserSmallDTO>> GetUserByIdAsync(int id)
        {
            return await _userService.GetUserSmallByIdAsync(id);
        }

        [HttpGet("{id}/details")]
        public async Task<ActionResult<UserDetailsDTO>> GetUserDetailsByIdAsync(int id)
        {
            return await _userService.GetUserDetailsByIdAsync(id);
        }

        [HttpGet("small")]
        public async Task<ActionResult<List<UserSmallDTO>>> GetUsersByIdsAsync([FromQuery] List<int> userIds)
        {
            return await _userService.GetUsersByIdsAsync(userIds);
        }

        [HttpGet("usernames")]
        public async Task<ActionResult<List<UserSmallDTO>>> GetUsersByUsernamesAsync([FromQuery] List<string> usernames)
        {
            return await _userService.GetUsersByUsernamesAsync(usernames);
        }
    }
}