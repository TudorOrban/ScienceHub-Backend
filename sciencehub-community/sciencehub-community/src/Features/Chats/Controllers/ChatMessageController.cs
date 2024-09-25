using Microsoft.AspNetCore.Mvc;
using sciencehub_community.Features.Chats.DTOs;
using sciencehub_community.Features.Chats.Services;
using sciencehub_core.Shared.Search;

namespace sciencehub_community.Features.Chats.Controllers
{
    [ApiController]
    [Route("api/v1/chat-messages")]
    public class ChatMessageController : ControllerBase
    {
        private readonly IChatMessageService _chatMessageService;

        public ChatMessageController(IChatMessageService chatMessageService)
        {
            _chatMessageService = chatMessageService;
        }

        [HttpGet("chat/{chatId}/search")]
        public async Task<ActionResult<PaginatedResults<ChatMessageSearchDTO>>> SearchChatMessagesById(
            int chatId,
            [FromQuery] string searchTerm = "",
            [FromQuery] int page = 1,
            [FromQuery] int itemsPerPage = 10,
            [FromQuery] string sortBy = "createdAt",
            [FromQuery] bool sortDescending = false)
        {
            SearchParams searchParams = new SearchParams { SearchTerm = searchTerm, Page = page, ItemsPerPage = itemsPerPage, SortBy = sortBy, SortDescending = sortDescending };
            
            var chatMessages = await _chatMessageService.SearchChatMessagesByChatIdAsync(chatId, searchParams);

            return Ok(chatMessages);
        }
    }
}