using Microsoft.EntityFrameworkCore;
using sciencehub_core.Core.Users.Models;
using sciencehub_core.Features.Issues.Models;
using sciencehub_core.Features.Works.Models;
using sciencehub_core.Features.Projects.Models;
using sciencehub_core.Features.Reviews.Models;
using sciencehub_core.Features.Submissions.Models;
using sciencehub_core.Features.Submissions.VersionControlSystem.Models;
using sciencehub_core.Features.Submissions.VersionControlSystem.Reconstruction.Models;
using sciencehub_core.Shared.Enums;

namespace sciencehub_core.Data
{
    public class CoreServiceDbContext : DbContext
    {
        public CoreServiceDbContext(DbContextOptions<CoreServiceDbContext> options) : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            ConfigureProjectEntities(modelBuilder);

            ConfigureWorkEntities(modelBuilder);

            ConfigureManagementEntities(modelBuilder);

            ConfigureEnums(modelBuilder);
        }

        private void ConfigureProjectEntities(ModelBuilder modelBuilder)
        {
            // Many-to-many between projects and users
            modelBuilder.Entity<ProjectUser>()
                .ToTable("project_users")
                .HasKey(pu => new { pu.ProjectId, pu.UserId });

            modelBuilder.Entity<ProjectUser>()
                .HasOne(pu => pu.Project)
                .WithMany(p => p.ProjectUsers)
                .HasForeignKey(pu => pu.ProjectId);

            modelBuilder.Entity<ProjectUser>()
                .HasOne(pu => pu.User)
                .WithMany(u => u.ProjectUsers)
                .HasForeignKey(pu => pu.UserId);
        }

        private void ConfigureWorkEntities(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Work>().ToTable("works");
            
            modelBuilder.Entity<WorkUser>()
                .ToTable("work_users")
                .HasKey(pu => new { pu.WorkId, pu.UserId });

            modelBuilder.Entity<WorkUser>()
                .HasOne(pu => pu.Work)
                .WithMany(p => p.WorkUsers)
                .HasForeignKey(pu => pu.WorkId);

            modelBuilder.Entity<WorkUser>()
                .HasOne(pu => pu.User)
                .WithMany(u => u.WorkUsers)
                .HasForeignKey(pu => pu.UserId);
        }

        private void ConfigureManagementEntities(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ProjectWorkSubmission>()
                .ToTable("project_work_submissions")
                .HasKey(pws => new { pws.ProjectSubmissionId, pws.WorkSubmissionId });

            modelBuilder.Entity<ProjectWorkSubmission>()
                .HasOne(pws => pws.ProjectSubmission)
                .WithMany(ps => ps.ProjectWorkSubmissions)
                .HasForeignKey(pws => pws.ProjectSubmissionId);

            modelBuilder.Entity<ProjectWorkSubmission>()
                .HasOne(pws => pws.WorkSubmission)
                .WithMany(ws => ws.ProjectWorkSubmissions)
                .HasForeignKey(pws => pws.WorkSubmissionId);

            modelBuilder.Entity<ProjectSubmissionUser>()
                .ToTable("project_submission_users")
                .HasKey(psu => new { psu.ProjectSubmissionId, psu.UserId });

            modelBuilder.Entity<ProjectSubmissionUser>()
                .HasOne(psu => psu.ProjectSubmission)
                .WithMany(ps => ps.ProjectSubmissionUsers)
                .HasForeignKey(psu => psu.ProjectSubmissionId);

            modelBuilder.Entity<ProjectSubmissionUser>()
                .HasOne(psu => psu.User)
                .WithMany(u => u.ProjectSubmissionUsers)
                .HasForeignKey(psu => psu.UserId);

            modelBuilder.Entity<WorkSubmissionUser>()
                .ToTable("work_submission_users")
                .HasKey(wsu => new { wsu.WorkSubmissionId, wsu.UserId });

            modelBuilder.Entity<WorkSubmissionUser>()
                .HasOne(wsu => wsu.WorkSubmission)
                .WithMany(ws => ws.WorkSubmissionUsers)
                .HasForeignKey(wsu => wsu.WorkSubmissionId);

            modelBuilder.Entity<WorkSubmissionUser>()
                .HasOne(wsu => wsu.User)
                .WithMany(u => u.WorkSubmissionUsers)
                .HasForeignKey(wsu => wsu.UserId);

            modelBuilder.Entity<IssueUser>()
                .ToTable("issue_users")
                .HasKey(iu => new { iu.IssueId, iu.UserId });

            modelBuilder.Entity<IssueUser>()
                .HasOne(iu => iu.Issue)
                .WithMany(i => i.IssueUsers)
                .HasForeignKey(iu => iu.IssueId);

            modelBuilder.Entity<IssueUser>()
                .HasOne(iu => iu.User)
                .WithMany(u => u.IssueUsers)
                .HasForeignKey(iu => iu.UserId);
                
            modelBuilder.Entity<ReviewUser>()
                .ToTable("review_users")
                .HasKey(ru => new { ru.ReviewId, ru.UserId });

            modelBuilder.Entity<ReviewUser>()
                .HasOne(ru => ru.Review)
                .WithMany(r => r.ReviewUsers)
                .HasForeignKey(ru => ru.ReviewId);
            
            modelBuilder.Entity<ReviewUser>()
                .HasOne(ru => ru.User)
                .WithMany(u => u.ReviewUsers)
                .HasForeignKey(ru => ru.UserId);
        }

        private void ConfigureEnums(ModelBuilder modelBuilder)
        {
            // Register enums
            modelBuilder.HasPostgresEnum<SubmissionStatus>();
            modelBuilder.HasPostgresEnum<IssueStatus>();
            modelBuilder.HasPostgresEnum<ReviewStatus>();
            modelBuilder.HasPostgresEnum<WorkType>();
        }

        // Projects
        public DbSet<Project> Projects { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<ProjectUser> ProjectUsers { get; set; }
        public DbSet<ProjectVersion> ProjectVersions { get; set; }
        public DbSet<ProjectGraph> ProjectGraphs { get; set; }

        // Works
        public DbSet<Work> Works { get; set; }
        public DbSet<WorkUser> WorkUsers { get; set; }

        // Version control
        public DbSet<WorkVersion> WorkVersions { get; set; }
        public DbSet<WorkGraph> WorkGraphs { get; set; }
        public DbSet<WorkSnapshot> WorkSnapshots { get; set; }
        public DbSet<ProjectSnapshot> ProjectSnapshots { get; set; }
        
        public DbSet<ProjectSubmission> ProjectSubmissions { get; set; }
        public DbSet<WorkSubmission> WorkSubmissions { get; set; }
        public DbSet<ProjectWorkSubmission> ProjectWorkSubmissions { get; set; }
        public DbSet<ProjectSubmissionUser> ProjectSubmissionUsers { get; set; }
        public DbSet<WorkSubmissionUser> WorkSubmissionUsers { get; set; }

        // Rest of management
        public DbSet<Issue> Issues { get; set; }
        public DbSet<IssueUser> IssueUsers { get; set; }
        public DbSet<Review> Reviews { get; set; }
        public DbSet<ReviewUser> ReviewUsers { get; set; }

    }
}
