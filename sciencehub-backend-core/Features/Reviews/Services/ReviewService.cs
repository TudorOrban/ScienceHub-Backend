using sciencehub_backend_core.Core.Users.DTOs;
using sciencehub_backend_core.Exceptions.Errors;
using sciencehub_backend_core.Features.Reviews.DTOs;
using sciencehub_backend_core.Features.Reviews.Models;
using sciencehub_backend_core.Features.Reviews.Repositories;
using sciencehub_backend_core.Shared.Enums;
using sciencehub_backend_core.Shared.Sanitation;
using sciencehub_backend_core.Shared.Search;

namespace sciencehub_backend_core.Features.Reviews.Services
{
    public class ReviewService : IReviewService
    {
        private readonly IReviewRepository _ReviewRepository;
        private readonly ISanitizerService _sanitizerService;

        public ReviewService(IReviewRepository ReviewRepository, ISanitizerService sanitizerService)
        {
            _ReviewRepository = ReviewRepository;
            _sanitizerService = sanitizerService;
        }

        public async Task<Review> GetReviewByIdAsync(int reviewId)
        {
            return await _ReviewRepository.FindReviewByIdAsync(reviewId);
        }

        public async Task<PaginatedResults<ReviewSearchDTO>> SearchReviewsByUserIdAndReviewTypeAsync(int id, ReviewType reviewType, SearchParams searchParams, bool? small = true)
        {
            var reviews = await _ReviewRepository.SearchReviewsByUserIdAndReviewTypeAsync(id, reviewType, searchParams);

            return new PaginatedResults<ReviewSearchDTO>
            {
                Results = reviews.Results.Select(r => MapToReviewSearchDTO(r, small)).ToList(),
                TotalCount = reviews.TotalCount
            };
        }

        private ReviewSearchDTO MapToReviewSearchDTO(Review r, bool? small)
        {
            var reviewDTO = new ReviewSearchDTO
            {
                Id = r.Id,
                Title = r.Title,
                Description = r.Description,                    
                CreatedAt = r.CreatedAt,
                Users = r.ReviewUsers.Select(u => new UserSmallDTO
                {
                    Id = u.UserId,
                    Username = u.User.Username,
                    FullName = u.User.FullName
                }).ToList()
            };

            return reviewDTO;
        }

        public async Task<Review> CreateReviewAsync(CreateReviewDTO createReviewDTO)
        {
            if (createReviewDTO.WorkId == null || !createReviewDTO.WorkId.HasValue)
            {
                throw new ResourceNotFoundException("Work", (!createReviewDTO.WorkId.HasValue) ? "null" : createReviewDTO.WorkId.Value.ToString());
            }
            var newReview = new Review
            {
                Id = createReviewDTO.WorkId.Value,
                Title = _sanitizerService.Sanitize(createReviewDTO.Title),
                Name = _sanitizerService.Sanitize(createReviewDTO.Name),
                Description = _sanitizerService.Sanitize(createReviewDTO.Description),
                IsPublic = createReviewDTO.IsPublic,
            };

            await _ReviewRepository.CreateReviewAsync(newReview, createReviewDTO.Users);

            return newReview;
        }

        public async Task<Review> UpdateReviewAsync(UpdateReviewDTO updateReviewDTO)
        {
            var Review = await _ReviewRepository.FindReviewByIdAsync(updateReviewDTO.Id);

            Review.Title = _sanitizerService.Sanitize(updateReviewDTO.Title);
            Review.Name = _sanitizerService.Sanitize(updateReviewDTO.Name);
            Review.Description = _sanitizerService.Sanitize(updateReviewDTO.Description);
            Review.IsPublic = updateReviewDTO.IsPublic;

            await _ReviewRepository.UpdateReviewAsync(Review);
            return Review;
        }

        public async Task<int> DeleteReviewAsync(int reviewId)
        {
            var review = await _ReviewRepository.FindReviewByIdAsync(reviewId);
            if (review == null)
            {
                throw new ResourceNotFoundException("Review", reviewId.ToString());
            }

            return await _ReviewRepository.DeleteReviewAsync(reviewId);
        }

    }
}