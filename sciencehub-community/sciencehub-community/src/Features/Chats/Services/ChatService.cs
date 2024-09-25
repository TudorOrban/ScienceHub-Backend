using sciencehub_community.Core.Users.Models;
using sciencehub_community.Core.Users.Services;
using sciencehub_community.Features.Chats.DTOs;
using sciencehub_community.Features.Chats.Models;
using sciencehub_community.Features.Chats.Repositories;
using sciencehub_core.Shared.Search;

namespace sciencehub_community.Features.Chats.Services
{
    public class ChatService : IChatService
    {
        private readonly IChatRepository _chatRepository;
        private readonly IUserService _userService;
        private readonly ILogger<ChatService> _logger;

        public ChatService(
            IChatRepository chatRepository,
            IUserService userService,
            ILogger<ChatService> logger
        )
        {
            _chatRepository = chatRepository;
            _userService = userService;
            _logger = logger;
        }

        public async Task<PaginatedResults<ChatSearchDTO>> SearchChatsByUserIdAsync(int userId, SearchParams searchParams, bool addUsers = false, bool isPublic = true)
        {
            var results = await _chatRepository.SearchChatsByUserIdAsync(userId, searchParams, isPublic);

            var users = new List<UserSmallDTO>();

            if (addUsers)
            {
                var userIds = results.Results.SelectMany(chat => chat.Users.ChatUsers.Select(chatUser => chatUser.UserId)).Distinct().ToList();

                users = await _userService.GetUsersByIdsAsync(userIds);
            }

            return new PaginatedResults<ChatSearchDTO>
            {
                Results = results.Results.Select(result => mapChatToSearchDTO(result, users)).ToList(),
                TotalCount = results.TotalCount,
            };
        }

        private ChatSearchDTO mapChatToSearchDTO(Chat chat, List<UserSmallDTO> users)
        {
            var chatUsers = chat.Users.ChatUsers.Select(chatUser => new ChatUserDTO
            {
                ChatId = chatUser.ChatId,
                UserId = chatUser.UserId,
                Role = chatUser.Role,
                User = users.FirstOrDefault(u => u.Id == chatUser.UserId),
            }).ToList();

            return new ChatSearchDTO
            {
                Id = chat.Id,
                Title = chat.Title,
                Content = chat.Content,
                CreatedAt = chat.CreatedAt,
                UpdatedAt = chat.UpdatedAt,
                ChatUsers = chatUsers, 
                IsPublic = chat.IsPublic,
            };
        }
    }
}