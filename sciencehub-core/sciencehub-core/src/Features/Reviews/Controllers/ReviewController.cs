using Microsoft.AspNetCore.Mvc;
using sciencehub_core.Features.Reviews.DTOs;
using sciencehub_core.Features.Reviews.Models;
using sciencehub_core.Features.Reviews.Services;
using sciencehub_core.Shared.Enums;
using sciencehub_core.Shared.Search;

namespace sciencehub_core.Features.Reviews.Controllers
{
    [ApiController]
    [Route("api/v1/reviews")]
    public class ReviewController : ControllerBase
    {
        private readonly IReviewService _ReviewService;

        public ReviewController(IReviewService ReviewService)
        {
            _ReviewService = ReviewService;
        }

        [HttpGet("{id}/")]
        public async Task<ActionResult<Review>> GetReview(int id)
        {
            var Review = await _ReviewService.GetReviewByIdAsync(id);
            return Ok(Review);
        }

        [HttpGet("reviewType/{reviewTypeString}/user/{userId}/search")]
        public async Task<ActionResult<PaginatedResults<ReviewSearchDTO>>> SearchReviewsById(
            int userId,
            string reviewTypeString,
            [FromQuery] string searchTerm = "",
            [FromQuery] int page = 1,
            [FromQuery] int itemsPerPage = 10,
            [FromQuery] string sortBy = "createdAt",
            [FromQuery] bool sortDescending = false)
        {
            ReviewType reviewType = Enum.Parse<ReviewType>(reviewTypeString);
            SearchParams searchParams = new SearchParams { SearchTerm = searchTerm, Page = page, ItemsPerPage = itemsPerPage, SortBy = sortBy, SortDescending = sortDescending };
            
            var Reviews = await _ReviewService.SearchReviewsByUserIdAndReviewTypeAsync(userId, reviewType, searchParams);

            return Ok(Reviews);
        }
        
        [HttpPost]
        public async Task<ActionResult<int>> CreateReview([FromBody] CreateReviewDTO createReviewDTO)
        {
            var reviewId = await _ReviewService.CreateReviewAsync(createReviewDTO);
            return CreatedAtRoute("", new { id = reviewId });
        }

        [HttpPut]
        public async Task<ActionResult<int>> UpdateReview([FromBody] UpdateReviewDTO updateReviewDTO)
        {
            var reviewId = await _ReviewService.UpdateReviewAsync(updateReviewDTO);
            return Ok(reviewId);
        }

        [HttpDelete("{reviewId}")]
        public async Task<ActionResult<int>> DeleteReview(int reviewId)
        {
            var deletedReviewId = await _ReviewService.DeleteReviewAsync(reviewId);
            return Ok(deletedReviewId);
        }
    }
}
