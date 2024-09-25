
using System.Text.Json.Serialization;
using Microsoft.EntityFrameworkCore;
using Npgsql;
using sciencehub_community.Core.Users.Services;
using sciencehub_community.Data;
using sciencehub_community.Exceptions;
using sciencehub_community.Exceptions.Errors;
using sciencehub_community.Features.Chats.Repositories;
using sciencehub_community.Features.Chats.Services;
using sciencehub_community.Features.Discussions.Repositories;
using sciencehub_community.Features.Discussions.Services;

namespace sciencehub_community.Core.Config
{
    public static class ConfigLoader
    {
        public static WebApplication ConfigureApplication(WebApplicationBuilder builder, bool isTest = false)
        {
            ConfigureHttpClients(builder);
            ConfigureServices(builder);
            ConfigureDatabase(builder, isTest);
            ConfigureCors(builder);

            var app = builder.Build();
            ConfigureMiddleware(app);

            return app;
        }


        public static void ConfigureServices(WebApplicationBuilder builder)
        {
            // Inner services
            builder.Services.AddScoped<IDiscussionRepository, DiscussionRepository>();
            builder.Services.AddScoped<IDiscussionService, DiscussionService>();
            builder.Services.AddScoped<IChatRepository, ChatRepository>();
            builder.Services.AddScoped<IChatService, ChatService>();
            builder.Services.AddScoped<IChatMessageRepository, ChatMessageRepository>();
            builder.Services.AddScoped<IChatMessageService, ChatMessageService>();

            // Inter-communication services
            builder.Services.AddScoped<IUserService, UserService>();

            
            // Configure Json Options
            builder.Services.AddControllers().AddJsonOptions(options => {
                options.JsonSerializerOptions.PropertyNameCaseInsensitive = true;
                options.JsonSerializerOptions.NumberHandling = 
                JsonNumberHandling.AllowReadingFromString |
                JsonNumberHandling.WriteAsString;
                options.JsonSerializerOptions.ReferenceHandler = ReferenceHandler.IgnoreCycles;
            });
        }

        public static void ConfigureHttpClients(WebApplicationBuilder builder)
        {
            var coreServiceBaseUrl = builder.Configuration["CoreServiceApi:BaseUrl"];
            if (string.IsNullOrEmpty(coreServiceBaseUrl))
            {
                throw new ConfigurationException("CoreServiceApi:BaseUrl is not set in appsettings.json");
            }
            builder.Services.AddHttpClient("CoreService", client =>
            {
                client.BaseAddress = new Uri(coreServiceBaseUrl); 
            });
        }

        // Add database connection
        public static void ConfigureDatabase(WebApplicationBuilder builder, bool isTest = false)
        {
            if (!isTest)
            {
                var connectionString = builder.Configuration.GetConnectionString("DefaultConnection");
                var dataSourceBuilder = new NpgsqlDataSourceBuilder(connectionString);

                var dataSource = dataSourceBuilder.Build();

                builder.Services.AddDbContext<CommunityServiceDbContext>(options =>
                    options.UseNpgsql(dataSource));
            }
            else
            {
                // Configure for in-memory database
                builder.Services.AddDbContext<CommunityServiceDbContext>(options =>
                    options.UseInMemoryDatabase("InMemoryDbForTesting"));

                // Build the service provider and create a scope
                var serviceProvider = builder.Services.BuildServiceProvider();
                using var scope = serviceProvider.CreateScope();
                var db = scope.ServiceProvider.GetRequiredService<CommunityServiceDbContext>();

                // Ensure the database is created
                db.Database.EnsureCreated();
            }
        }

        // Configure CORS policy
        public static void ConfigureCors(WebApplicationBuilder builder)
        {
            builder.Services.AddCors(options =>
            {
                options.AddPolicy("AllowSpecificOrigin",
                    corsBuilder => corsBuilder.WithOrigins("http://localhost:3000")
                                              .AllowAnyHeader()
                                              .AllowAnyMethod());
            });
        }

        public static void ConfigureMiddleware(WebApplication app)
        {
            // Configure the HTTP request pipeline.
            if (app.Environment.IsDevelopment())
            {
                app.UseSwagger();
                app.UseSwaggerUI();
            }

            app.UseMiddleware<CustomErrorHandlingMiddleware>();
            app.UseHttpsRedirection();

            // Apply CORS policy
            app.UseCors("AllowSpecificOrigin");
            app.UseAuthorization();
            app.MapControllers();
        }
    }
}
