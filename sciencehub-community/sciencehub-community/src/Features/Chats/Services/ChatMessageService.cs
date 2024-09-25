using sciencehub_community.Core.Users.Models;
using sciencehub_community.Core.Users.Services;
using sciencehub_community.Features.Chats.DTOs;
using sciencehub_community.Features.Chats.Models;
using sciencehub_community.Features.Chats.Repositories;
using sciencehub_core.Shared.Search;

namespace sciencehub_community.Features.Chats.Services
{
    public class ChatMessageService : IChatMessageService
    {
        private readonly IChatMessageRepository _chatMessageRepository;
        private readonly IUserService _userService;
        private readonly ILogger<ChatMessageService> _logger;

        public ChatMessageService(
            IChatMessageRepository chatMessageRepository,
            IUserService userService,
            ILogger<ChatMessageService> logger
        )
        {
            _chatMessageRepository = chatMessageRepository;
            _userService = userService;
            _logger = logger;
        }

        public async Task<PaginatedResults<ChatMessageSearchDTO>> SearchChatMessagesByChatIdAsync(int chatId, SearchParams searchParams, bool addUsers = false)
        {
            var results = await _chatMessageRepository.SearchChatMessagesByChatIdAsync(chatId, searchParams);

            var users = new List<UserSmallDTO>();

            if (addUsers)
            {
                var userIds = results.Results.Select(chatMessage => chatMessage.UserId).Distinct().ToList();

                users = await _userService.GetUsersByIdsAsync(userIds);
            }

            return new PaginatedResults<ChatMessageSearchDTO>
            {
                Results = results.Results.Select(result => mapChatMessageToSearchDTO(result, users)).ToList(),
                TotalCount = results.TotalCount,
            };
        }

        private ChatMessageSearchDTO mapChatMessageToSearchDTO(ChatMessage chatMessage, List<UserSmallDTO>? users)
        {
            return new ChatMessageSearchDTO
            {
                Id = chatMessage.Id,
                ChatId = chatMessage.ChatId,
                Content = chatMessage.Content,
                CreatedAt = chatMessage.CreatedAt,
                UpdatedAt = chatMessage.UpdatedAt,
                UserId = chatMessage.UserId,
                User = users != null ? users.FirstOrDefault(u => u.Id == chatMessage.UserId) : null,
            };
        }
    }
}