using Microsoft.AspNetCore.Mvc;
using sciencehub_community.Features.Discussions.DTOs;
using sciencehub_community.Features.Discussions.Services;
using sciencehub_core.Shared.Search;

namespace sciencehub_community.Features.Discussions.Controllers
{
    [ApiController]
    [Route("api/v1/discussions")]
    public class DiscussionController : ControllerBase
    {
        private readonly IDiscussionService _discussionService;

        public DiscussionController(IDiscussionService discussionService)
        {
            _discussionService = discussionService;
        }

        [HttpGet("user/{userId}/search")]
        public async Task<ActionResult<PaginatedResults<DiscussionSearchDTO>>> SearchDiscussionsById(
            int userId,
            [FromQuery] string searchTerm = "",
            [FromQuery] int page = 1,
            [FromQuery] int itemsPerPage = 10,
            [FromQuery] string sortBy = "createdAt",
            [FromQuery] bool sortDescending = false)
        {
            SearchParams searchParams = new SearchParams { SearchTerm = searchTerm, Page = page, ItemsPerPage = itemsPerPage, SortBy = sortBy, SortDescending = sortDescending };
            
            var discussions = await _discussionService.SearchDiscussionsByUserIdAsync(userId, searchParams);

            return Ok(discussions);
        }
    }
}