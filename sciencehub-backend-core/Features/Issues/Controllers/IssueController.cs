using Microsoft.AspNetCore.Mvc;
using sciencehub_backend_core.Features.Issues.DTOs;
using sciencehub_backend_core.Features.Issues.Models;
using sciencehub_backend_core.Features.Issues.Services;
using sciencehub_backend_core.Shared.Enums;
using sciencehub_backend_core.Shared.Search;

namespace sciencehub_backend_core.Features.Issues.Controllers
{
    [ApiController]
    [Route("api/v1/issues")]
    public class IssueController : ControllerBase
    {
        private readonly IIssueService _IssueService;

        public IssueController(IIssueService IssueService)
        {
            _IssueService = IssueService;
        }

        [HttpGet("{id}/")]
        public async Task<ActionResult<Issue>> GetIssue(int id)
        {
            var Issue = await _IssueService.GetIssueByIdAsync(id);
            return Ok(Issue);
        }

        [HttpGet("issueType/{issueTypeString}/user/{userId}/search")]
        public async Task<ActionResult<PaginatedResults<IssueSearchDTO>>> SearchIssuesById(
            int userId,
            string issueTypeString,
            [FromQuery] string searchTerm = "",
            [FromQuery] int page = 1,
            [FromQuery] int itemsPerPage = 10,
            [FromQuery] string sortBy = "createdAt",
            [FromQuery] bool sortDescending = false)
        {
            IssueType issueType = Enum.Parse<IssueType>(issueTypeString);
            SearchParams searchParams = new SearchParams { SearchTerm = searchTerm, Page = page, ItemsPerPage = itemsPerPage, SortBy = sortBy, SortDescending = sortDescending };
            
            var Issues = await _IssueService.SearchIssuesByUserIdAndIssueTypeAsync(userId, issueType, searchParams);

            return Ok(Issues);
        }
        
        [HttpPost]
        public async Task<ActionResult<int>> CreateIssue([FromBody] CreateIssueDTO createIssueDTO)
        {
            var issueId = await _IssueService.CreateIssueAsync(createIssueDTO);
            return CreatedAtRoute("", new { id = issueId });
        }

        [HttpPut]
        public async Task<ActionResult<int>> UpdateIssue([FromBody] UpdateIssueDTO updateIssueDTO)
        {
            var issueId = await _IssueService.UpdateIssueAsync(updateIssueDTO);
            return Ok(issueId);
        }

        [HttpDelete("{issueId}")]
        public async Task<ActionResult<int>> DeleteIssue(int issueId)
        {
            var deletedIssueId = await _IssueService.DeleteIssueAsync(issueId);
            return Ok(deletedIssueId);
        }
    }
}
