using sciencehub_core.Core.Users.DTOs;
using sciencehub_core.Features.Works.DTOs;
using sciencehub_core.Features.Works.Models;
using sciencehub_core.Features.Works.Repositories;
using sciencehub_core.Shared.Enums;
using sciencehub_core.Shared.Search;

namespace sciencehub_core.Features.Works.Services
{
    public class WorkService : IWorkService 
    {
        private readonly IWorkRepository _workRepository;

        public WorkService(IWorkRepository workRepository)
        {
            _workRepository = workRepository;
        }

        // Read
        public async Task<WorkDetailsDTO> GetWorkDetailsAsync(int workId)
        {
            var work = await _workRepository.GetWorkAsync(workId);

            return mapWorkToWorkDetailsDTO(work);
        }

        public async Task<IEnumerable<WorkSearchDTO>> GetWorksByUserIdAsync(int userId)
        {
            var works = await _workRepository.GetWorksByUserIdAsync(userId);

            return works.Select(mapWorkToWorkSearchDTO);
        }

        public async Task<IEnumerable<WorkSearchDTO>> GetWorksByProjectIdAsync(int projectId)
        {
            var works = await _workRepository.GetWorksByProjectIdAsync(projectId);

            return works.Select(mapWorkToWorkSearchDTO);
        }

        public async Task<IEnumerable<WorkSearchDTO>> GetWorksByTypeAndUserIdAsync(WorkType type, int userId)
        {
            var works = await _workRepository.GetWorksByTypeAndUserIdAsync(type, userId);

            return works.Select(mapWorkToWorkSearchDTO);
        }

        public async Task<IEnumerable<WorkSearchDTO>> GetWorksByTypeAndProjectIdAsync(WorkType type, int projectId)
        {
            var works = await _workRepository.GetWorksByTypeAndProjectIdAsync(type, projectId);

            return works.Select(mapWorkToWorkSearchDTO);
        }

        public async Task<PaginatedResults<WorkSearchDTO>> SearchWorksByTypeAndUserIdAsync(int userId, WorkType workType, SearchParams searchParams)
        {
            var paginatedWorks = await _workRepository.SearchWorksByTypeAndUserIdAsync(userId, workType, searchParams);

            return new PaginatedResults<WorkSearchDTO>
            {
                Results = paginatedWorks.Results.Select(mapWorkToWorkSearchDTO).ToList(),
                TotalCount = paginatedWorks.TotalCount
            };
        }

        // Write
        public async Task<WorkDetailsDTO> CreateWorkAsync(CreateWorkDTO workDTO)
        {
            var work = mapCreateWorkDTOToWork(workDTO);

            return await _workRepository.CreateWorkAsync(work)
                .ContinueWith(_ => mapWorkToWorkDetailsDTO(work));
        }

        public async Task<WorkDetailsDTO> UpdateWorkAsync(UpdateWorkDTO workDTO)
        {
            var work = await _workRepository.GetWorkAsync(workDTO.Id);

            work = setUpdateWorkDTOToWork(work, workDTO);

            return await _workRepository.UpdateWorkAsync(work)
                .ContinueWith(_ => mapWorkToWorkDetailsDTO(work));
        }

        public async Task<int> DeleteWorkAsync(int workId)
        {
            await _workRepository.DeleteWorkAsync(workId);
            return workId;
        }

        // Mappers
        private WorkSearchDTO mapWorkToWorkSearchDTO(Work work)
        {
            return new WorkSearchDTO
            {
                Id = work.Id,
                Title = work.Title,
                Name = work.Name,
                Description = work.Description,
                WorkType = work.WorkType,
                CreatedAt = work.CreatedAt,
                UpdatedAt = work.UpdatedAt,
                ResearchScore = work.ResearchScore,
                CitationsCount = work.TotalCitations,
                IsPublic = work.IsPublic,
                CurrentWorkVersionId = work.CurrentWorkVersionId,
                Users = work.WorkUsers.Select(wu => new UserSmallDTO
                {
                    Id = wu.UserId,
                    Username = wu.User.Username,
                    FullName = wu.User.FullName
                }).ToList()
            };
        }

        private WorkDetailsDTO mapWorkToWorkDetailsDTO(Work work)
        {
            return new WorkDetailsDTO
            {
                Id = work.Id,
                Title = work.Title,
                Name = work.Name,
                Description = work.Description,
                WorkType = work.WorkType,
                CreatedAt = work.CreatedAt,
                UpdatedAt = work.UpdatedAt,
                ResearchScore = work.ResearchScore,
                CitationsCount = work.TotalCitations,
                IsPublic = work.IsPublic,
                CurrentWorkVersionId = work.CurrentWorkVersionId,
                Users = work.WorkUsers.Select(wu => new UserSmallDTO
                {
                    Id = wu.UserId,
                    Username = wu.User.Username,
                    FullName = wu.User.FullName
                }).ToList()
            };
        }

        private Work mapCreateWorkDTOToWork(CreateWorkDTO workDTO)
        {
            return new Work
            {
                Title = workDTO.Title,
                Description = workDTO.Description,
                WorkType = Enum.Parse<WorkType>(workDTO.WorkType),
                CreatedAt = DateTime.UtcNow,
                UpdatedAt = DateTime.UtcNow
            };
        }

        private Work setUpdateWorkDTOToWork(Work work, UpdateWorkDTO workDTO)
        {
            work.Title = workDTO.Title;
            work.Description = workDTO.Description;
            work.WorkType = Enum.Parse<WorkType>(workDTO.WorkType);
            work.UpdatedAt = DateTime.UtcNow;

            return work;
        }
    }

}