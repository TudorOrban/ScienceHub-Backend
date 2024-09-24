using sciencehub_backend_community.Core.Users.Models;
using sciencehub_backend_community.Core.Users.Services;
using sciencehub_backend_community.Features.Chats.DTOs;
using sciencehub_backend_community.Features.Chats.Models;
using sciencehub_backend_community.Features.Chats.Repositories;
using sciencehub_backend_core.Shared.Search;

namespace sciencehub_backend_community.Features.Chats.Services
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
            var chatUsersData = chat.Users ?? new ChatUsersData();
            chatUsersData.ChatUsers.ForEach(chatUser =>
            {
                var user = users.FirstOrDefault(u => u.Id == chatUser.UserId);
                chatUser.User = user;
            });

            return new ChatSearchDTO
            {
                Id = chat.Id,
                Title = chat.Title,
                Content = chat.Content,
                CreatedAt = chat.CreatedAt,
                UpdatedAt = chat.UpdatedAt,
                ChatUsersData = chatUsersData,
                IsPublic = chat.IsPublic,
            };
        }
    }
}