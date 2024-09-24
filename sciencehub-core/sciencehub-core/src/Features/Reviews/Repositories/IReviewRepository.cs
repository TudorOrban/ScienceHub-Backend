using sciencehub_core.Features.Reviews.Models;
using sciencehub_core.Shared.Enums;
using sciencehub_core.Shared.Search;

namespace sciencehub_core.Features.Reviews.Repositories
{
    public interface IReviewRepository
    {
        Task<Review> FindReviewByIdAsync(int reviewId);
        Task<PaginatedResults<Review>> SearchReviewsByUserIdAndReviewTypeAsync(int userId, ReviewType reviewType, SearchParams searchParams);
        Task<Review> CreateReviewAsync(Review newReview, IEnumerable<string> userIdStrings);
        Task<Review> UpdateReviewAsync(Review Review);
        Task<int> DeleteReviewAsync(int reviewId);
    }
}