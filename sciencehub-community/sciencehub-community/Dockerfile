FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
USER app
WORKDIR /app
EXPOSE 8081

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["sciencehub-community/sciencehub-community.csproj", "sciencehub-community/"]
RUN dotnet restore "./sciencehub-community/sciencehub-community.csproj"
COPY . .
WORKDIR "/src/sciencehub-community"
RUN dotnet build "./sciencehub-community.csproj" -c "$BUILD_CONFIGURATION" -o /app/build

FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./sciencehub-community.csproj" -c "$BUILD_CONFIGURATION" -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "sciencehub-community.dll"]