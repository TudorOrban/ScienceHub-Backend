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
        private readonly ILogger<ChatService> _logger;

        public ChatService(
            IChatRepository chatRepository,
            ILogger<ChatService> logger
        )
        {
            _chatRepository = chatRepository;
            _logger = logger;
        }

        public async Task<PaginatedResults<ChatSearchDTO>> SearchChatsByUserIdAsync(int userId, SearchParams searchParams)
        {
            var results = await _chatRepository.SearchChatsByUserIdAsync(userId, searchParams);

            return new PaginatedResults<ChatSearchDTO>
            {
                Results = results.Results.Select(mapChatToSearchDTO).ToList(),
                TotalCount = results.TotalCount,
            };
        }

        private ChatSearchDTO mapChatToSearchDTO(Chat chat)
        {
            return new ChatSearchDTO
            {
                Id = chat.Id,
                Title = chat.Title,
                Content = chat.Content,
                CreatedAt = chat.CreatedAt,
                UpdatedAt = chat.UpdatedAt,
                ChatUsersData = chat.Users,
                IsPublic = chat.IsPublic,
            };
        }
    }
}