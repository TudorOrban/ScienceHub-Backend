using Microsoft.AspNetCore.Mvc;
using sciencehub_community.Features.Chats.DTOs;
using sciencehub_community.Features.Chats.Services;
using sciencehub_core.Shared.Search;

namespace sciencehub_community.Features.Chats.Controllers
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
            [FromQuery] bool addUsers = false,
            [FromQuery] bool isPublic = false,
            [FromQuery] string searchTerm = "",
            [FromQuery] int page = 1,
            [FromQuery] int itemsPerPage = 10,
            [FromQuery] string sortBy = "createdAt",
            [FromQuery] bool sortDescending = false)
        {
            SearchParams searchParams = new SearchParams { SearchTerm = searchTerm, Page = page, ItemsPerPage = itemsPerPage, SortBy = sortBy, SortDescending = sortDescending };
            
            var chats = await _chatService.SearchChatsByUserIdAsync(userId, searchParams, addUsers, isPublic);

            return Ok(chats);
        }

        [HttpGet("{chatId}")]
        public async Task<ActionResult<ChatSearchDTO>> GetChatById(
            int chatId,
            [FromQuery] bool addUsers = false)
        {
            var chat = await _chatService.GetChatByIdAsync(chatId, addUsers);

            return Ok(chat);
        }
    }
}