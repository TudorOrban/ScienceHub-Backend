

using sciencehub_community.Core.Config;

var builder = WebApplication.CreateBuilder(args);

var port = Environment.GetEnvironmentVariable("PORT") ?? "8081";
builder.WebHost.UseUrls($"http://*:{port}");

var app = ConfigLoader.ConfigureApplication(builder, false);

app.Run();

