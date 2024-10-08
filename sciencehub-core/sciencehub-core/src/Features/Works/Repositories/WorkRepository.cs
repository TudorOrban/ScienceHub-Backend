using Microsoft.EntityFrameworkCore;
using sciencehub_core.Data;
using sciencehub_core.Exceptions.Errors;
using sciencehub_core.Features.Works.Models;
using sciencehub_core.Shared.Enums;
using sciencehub_core.Shared.Search;

namespace sciencehub_core.Features.Works.Repositories
{
    public class WorkRepository : IWorkRepository
    {
        private readonly CoreServiceDbContext _context;

        public WorkRepository(CoreServiceDbContext context)
        {
            _context = context;
        }

        public async Task<Work> GetWorkAsync(int workId)
        {
            return await _context.Works
                .Where(w => w.Id == workId)
                .Include(w => w.WorkUsers)
                    .ThenInclude(w => w.User)
                .SingleOrDefaultAsync()
                ?? throw new ResourceNotFoundException($"Work", workId.ToString());
        }

        public async Task<IEnumerable<Work>> GetWorksByProjectIdAsync(int projectId)
        {
            return await _context.Works
                .Where(w => w.ProjectId == projectId)
                .Where(w => w != null)
                .ToListAsync();
        }

        public async Task<IEnumerable<Work>> GetWorksByUserIdAsync(int userId)
        {
            var workIds = await _context.WorkUsers
                .Where(wu => wu.UserId == userId)
                .Select(wu => wu.WorkId)
                .Distinct()
                .ToListAsync();

            var works = new List<Work>();
            foreach (var workId in workIds)
            {
                var work = await _context.Works
                    .Include(w => w.WorkUsers)
                    .ThenInclude(wu => wu.User)
                    .SingleOrDefaultAsync(w => w.Id == workId);
                if (work != null)
                {
                    works.Add(work);
                }
            }

            return works;
        }

        public async Task<IEnumerable<Work>> GetWorksByTypeAndUserIdAsync(WorkType workType, int userId)
        {
            return await _context.WorkUsers
                .Where(wu => wu.UserId == userId)
                .Select(wu => wu.Work)
                .Where(w => w != null && w.WorkType == workType)
                .ToListAsync();
        }

        public async Task<IEnumerable<Work>> GetWorksByTypeAndProjectIdAsync(WorkType workType, int projectId)
        {
            return await _context.Works
                .Where(w => w.ProjectId == projectId)
                .Where(w => w != null && w.WorkType == workType)
                .ToListAsync();
        }

        public async Task<PaginatedResults<Work>> SearchWorksByTypeAndUserIdAsync(int userId, WorkType workType, SearchParams searchParams)
        {
            var query = _context.Works
                .Include(w => w.WorkUsers)
                    .ThenInclude(wu => wu.User)
                .Where(w => w.WorkUsers.Any(wu => wu.UserId == userId) && w.WorkType == workType);

            // Apply search query filtering
            if (!string.IsNullOrEmpty(searchParams.SearchTerm))
            {
                query = query.Where(w => w.Title.Contains(searchParams.SearchTerm));
            }

            // Apply sorting
            query = ApplySorting(query, searchParams.SortBy, searchParams.SortDescending);

            // Calculate total item count
            var totalItemCount = await query.CountAsync();

            // Pagination
            var works = await query
                .Skip(((searchParams.Page ?? 1) - 1) * (searchParams.ItemsPerPage ?? 10))
                .Take(searchParams.ItemsPerPage ?? 10)
                .ToListAsync();

            return new PaginatedResults<Work>
            {
                Results = works,
                TotalCount = totalItemCount
            };
        }
        
        private IQueryable<Work> ApplySorting(IQueryable<Work> query, string? sortBy, bool descending)
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
        
        public async Task<Work> CreateWorkAsync(Work work)
        {
            _context.Works.Add(work);
            await _context.SaveChangesAsync();
            return work;
        }

        public async Task<Work> UpdateWorkAsync(Work work)
        {
            _context.Works.Update(work);
            await _context.SaveChangesAsync();
            return work;
        }
        
        public async Task DeleteWorkAsync(int workId)
        {
            var work = await GetWorkAsync(workId);
            _context.Works.Remove(work);
            await _context.SaveChangesAsync();
        }
    }
}