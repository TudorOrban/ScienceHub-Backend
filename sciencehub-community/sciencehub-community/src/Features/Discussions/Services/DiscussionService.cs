using sciencehub_community.Core.Users.Models;
using sciencehub_community.Core.Users.Services;
using sciencehub_community.Features.Discussions.DTOs;
using sciencehub_community.Features.Discussions.Models;
using sciencehub_community.Features.Discussions.Repositories;
using sciencehub_core.Shared.Search;

namespace sciencehub_community.Features.Discussions.Services
{
    public class DiscussionService : IDiscussionService
    {
        private readonly IDiscussionRepository _discussionRepository;
        private readonly IUserService _userService;
        private readonly ILogger<DiscussionService> _logger;

        public DiscussionService(
            IDiscussionRepository discussionRepository,
            IUserService userService,
            ILogger<DiscussionService> logger
        )
        {
            _discussionRepository = discussionRepository;
            _userService = userService;
            _logger = logger;
        }

        public async Task<PaginatedResults<DiscussionSearchDTO>> SearchDiscussionsByUserIdAsync(int userId, SearchParams searchParams)
        {
            var results = await _discussionRepository.SearchDiscussionsByUserIdAsync(userId, searchParams);

            // Get user from Core microservice
            var users = await _userService.GetUsersByIdsAsync([userId]);
            var userDTO = users.FirstOrDefault()!;

            return new PaginatedResults<DiscussionSearchDTO>
            {
                Results = results.Results.Select(discussion => mapDiscussionToSearchDTO(discussion, userDTO)).ToList(),
                TotalCount = results.TotalCount,
            };
        }

        private DiscussionSearchDTO mapDiscussionToSearchDTO(Discussion discussion, UserSmallDTO userDTO)
        {
            return new DiscussionSearchDTO
            {
                Id = discussion.Id,
                Title = discussion.Title,
                Content = discussion.Content,
                CreatedAt = discussion.CreatedAt,
                UpdatedAt = discussion.UpdatedAt,
                UserId = discussion.UserId,
                TotalShares = discussion.TotalShares,
                TotalUpvotes = discussion.TotalUpvotes,
                TotalViews = discussion.TotalViews,
                IsPublic = discussion.IsPublic,
                User = userDTO
            };
        }
    }
}