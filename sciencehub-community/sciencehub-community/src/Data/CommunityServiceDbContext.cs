using Microsoft.EntityFrameworkCore;
using sciencehub_backend_community.Features.Chats.Models;
using sciencehub_backend_community.Features.Discussions.Models;


namespace sciencehub_backend_community.Data
{
    public class CommunityServiceDbContext : DbContext
    {
        public CommunityServiceDbContext(DbContextOptions<CommunityServiceDbContext> options) : base(options)
        {

        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Chat>()
                .OwnsOne(c => c.Users, d =>
                {
                    d.ToJson();
                    d.OwnsMany(u => u.ChatUsers);
                });
        }

        public DbSet<Discussion> Discussions { get; set; }
        public DbSet<Comment> Comments { get; set; }
        public DbSet<Chat> Chats { get; set; }
        public DbSet<ChatMessage> ChatMessages { get; set; }
    }
}
