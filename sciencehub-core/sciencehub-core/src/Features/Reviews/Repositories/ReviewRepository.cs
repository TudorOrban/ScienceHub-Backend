using Microsoft.EntityFrameworkCore;
using sciencehub_core.Data;
using sciencehub_core.Exceptions.Errors;
using sciencehub_core.Features.Reviews.Models;
using sciencehub_core.Shared.Enums;
using sciencehub_core.Shared.Search;

namespace sciencehub_core.Features.Reviews.Repositories
{
    public class ReviewRepository : IReviewRepository
    {
        private readonly CoreServiceDbContext _context;

        public ReviewRepository(CoreServiceDbContext context)
        {
            _context = context;
        }

        public async Task<Review> FindReviewByIdAsync(int reviewId)
        {
            var review = await _context.Reviews.FindAsync(reviewId);
            if (review == null)
            {
                throw new ResourceNotFoundException("Review", reviewId.ToString());
            }

            return review;
        }

        // Search
        public async Task<PaginatedResults<Review>> SearchReviewsByUserIdAndReviewTypeAsync(int userId, ReviewType reviewType, SearchParams searchParams)
        {
            var query = _context.Reviews
                .Include(i => i.ReviewUsers)
                    .ThenInclude(iu => iu.User)
                .Where(i => i.ReviewUsers.Any(iu => iu.UserId == userId))
                .Where(i => i.ReviewType == reviewType)
                .Where(i => i.IsPublic ?? false);

            if (!string.IsNullOrEmpty(searchParams.SearchTerm))
            {
                query = query.Where(i => i.Title.Contains(searchParams.SearchTerm));
            }

            query = ApplySorting(query, searchParams.SortBy, searchParams.SortDescending);

            var totalItemCount = await query.CountAsync();

            var Reviews = await query
                .Skip(((searchParams.Page ?? 1) - 1) * (searchParams.ItemsPerPage ?? 10))
                .Take(searchParams.ItemsPerPage ?? 10)
                .ToListAsync();

            return new PaginatedResults<Review>
            {
                Results = Reviews,
                TotalCount = totalItemCount
            };
        }
        
        private IQueryable<Review> ApplySorting(IQueryable<Review> query, string? sortBy, bool descending)
        {
            switch (sortBy)
            {
                case "title":
                    query = descending ? query.OrderByDescending(p => p.Title) : query.OrderBy(p => p.Title);
                    break;
                case "createdAt":
                    query = descending ? query.OrderByDescending(p => p.CreatedAt) : query.OrderBy(p => p.CreatedAt);
                    break;
                default:
                    throw new ArgumentException("Invalid sort field", nameof(sortBy));
            }
            return query;
        }

        public async Task<List<Review>> FindReviewsByIdAsync(int Id, ReviewType reviewType)
        {
            return await _context.Reviews.Where(pr => pr.Id == Id && pr.ReviewType == reviewType).ToListAsync();
        }

        // Create
        public async Task<Review> CreateReviewAsync(Review newReview, IEnumerable<string> userIdStrings)
        {
            _context.Reviews.Add(newReview);
            await _context.SaveChangesAsync();

            await AddUsersToReviewAsync(userIdStrings, newReview.Id);

            return newReview;
        }

        private async Task AddUsersToReviewAsync(IEnumerable<string> userIdStrings, int reviewId)
        {
            foreach (var userIdString in userIdStrings)
            {
                if (!int.TryParse(userIdString, out var userId))
                {
                    return;
                }
                _context.ReviewUsers.Add(new ReviewUser { ReviewId = reviewId, UserId = userId });
            }
            await _context.SaveChangesAsync();
        }

        // Update
        public async Task<Review> UpdateReviewAsync(Review Review)
        {
            _context.Reviews.Update(Review);
            await _context.SaveChangesAsync();

            return Review;
        }

        // Delete
        public async Task<int> DeleteReviewAsync(int reviewId)
        {
            var review = await FindReviewByIdAsync(reviewId);
            _context.Reviews.Remove(review);
            return await _context.SaveChangesAsync();
        }
    }
}