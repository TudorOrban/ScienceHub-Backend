using Ocelot.DependencyInjection;
using Ocelot.Middleware;

var builder = WebApplication.CreateBuilder(args);

var port = Environment.GetEnvironmentVariable("PORT") ?? "8082";
builder.WebHost.UseUrls($"http://*:{port}");

builder.Logging.AddConsole().SetMinimumLevel(LogLevel.Debug);
builder.Logging.AddDebug();
builder.Logging.SetMinimumLevel(LogLevel.Debug);

builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowSpecificOrigin", builder =>
        builder.WithOrigins("http://localhost:3000")  // URL of the frontend
               .AllowAnyHeader()
               .AllowAnyMethod()
               .AllowCredentials());
});

// Add services to the container.
IConfiguration configuration = new ConfigurationBuilder()
    .SetBasePath(Directory.GetCurrentDirectory())
    .AddJsonFile("Configuration.json")
    .Build();

builder.Services.AddOcelot(configuration);

builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();

var app = builder.Build();

app.UseCors("AllowSpecificOrigin");
app.UseHttpsRedirection();

app.UseRouting();

app.UseWebSockets(); 

app.UseAuthorization();

app.MapControllers();

await app.UseOcelot();

app.Run();
