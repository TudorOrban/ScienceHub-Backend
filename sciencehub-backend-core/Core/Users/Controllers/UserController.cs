using sciencehub_backend_core.Core.Users.Services;

using Microsoft.AspNetCore.Mvc;
using sciencehub_backend_core.Core.Users.DTOs;
using sciencehub_backend_core.Shared.Search;

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

        [HttpGet("search/username")]
        public async Task<ActionResult<PaginatedResults<UserSmallDTO>>> searchUsersByUsernameAsync(
            [FromQuery] string searchTerm = "",
            [FromQuery] string sortBy = "createdAt",
            [FromQuery] bool sortDescending = false,
            [FromQuery] int page = 1,
            [FromQuery] int itemsPerPage = 10
        )
        {
            SearchParams searchParams = new SearchParams { SearchTerm = searchTerm, SortBy = sortBy, SortDescending = sortDescending, Page = page, ItemsPerPage = itemsPerPage };
            return await _userService.searchUsersByUsernameAsync(searchParams);
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