using sciencehub_backend_core.Features.Reviews.DTOs;
using sciencehub_backend_core.Features.Reviews.Models;
using sciencehub_backend_core.Shared.Enums;
using sciencehub_backend_core.Shared.Search;

namespace sciencehub_backend_core.Features.Reviews.Services
{
    public interface IReviewService
    {
        Task<Review> GetReviewByIdAsync(int reviewId);
        Task<PaginatedResults<ReviewSearchDTO>> SearchReviewsByUserIdAndReviewTypeAsync(int userId, ReviewType reviewType, SearchParams searchParams, bool? small = true);
        Task<Review> CreateReviewAsync(CreateReviewDTO createReviewDTO);
        Task<Review> UpdateReviewAsync(UpdateReviewDTO updateReviewDTO);
        Task<int> DeleteReviewAsync(int reviewId);
    }
}