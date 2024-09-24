using Microsoft.AspNetCore.Mvc;
using sciencehub_backend_community.Features.Chats.DTOs;
using sciencehub_backend_community.Features.Chats.Services;
using sciencehub_backend_core.Shared.Search;

namespace sciencehub_backend_community.Features.Chats.Controllers
{
    [ApiController]
    [Route("api/v1/chats")]
    public class ChatController : ControllerBase
    {
        private readonly IChatService _chatService;

        public ChatController(IChatService chatService)
        {
            _chatService = chatService;
        }

        [HttpGet("user/{userId}/search")]
        public async Task<ActionResult<PaginatedResults<ChatSearchDTO>>> SearchChatsById(
            int userId,
            [FromQuery] string searchTerm = "",
            [FromQuery] int page = 1,
            [FromQuery] int itemsPerPage = 10,
            [FromQuery] string sortBy = "createdAt",
            [FromQuery] bool sortDescending = false)
        {
            SearchParams searchParams = new SearchParams { SearchTerm = searchTerm, Page = page, ItemsPerPage = itemsPerPage, SortBy = sortBy, SortDescending = sortDescending };
            
            var chats = await _chatService.SearchChatsByUserIdAsync(userId, searchParams);

            return Ok(chats);
        }
    }
}