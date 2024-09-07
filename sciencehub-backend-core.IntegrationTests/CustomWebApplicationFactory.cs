using Microsoft.AspNetCore.Mvc.Testing;
using Microsoft.EntityFrameworkCore;
using sciencehub_backend_core.Data;
using sciencehub_backend_core.Core.Config;

namespace sciencehub_backend_core.IntegrationTests
{
    public class CustomWebApplicationFactory : WebApplicationFactory<Program>
    {
        protected override void ConfigureWebHost(IWebHostBuilder builder)
        {
            builder.ConfigureServices(services =>
            {
                var startupAssembly = typeof(Program).Assembly;
                var configBuilder = new ConfigurationBuilder()
                    .AddJsonFile("appsettings.json")
                    .AddEnvironmentVariables();

                var config = configBuilder.Build();

                var builder = WebApplication.CreateBuilder();

                ConfigLoader.ConfigureApplication(builder, isTest: true);

            });
        }
    }

}