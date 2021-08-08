# FROM mcr.microsoft.com/dotnet/core/sdk:3.1.301-alpine AS builder
FROM mcr.microsoft.com/dotnet/core/sdk:3.1.301 AS builder

WORKDIR /src
COPY src/KubeExplorer.csproj .
RUN dotnet restore

COPY src/ .
RUN dotnet publish -c Release -o /out KubeExplorer.csproj

# app image
# FROM mcr.microsoft.com/dotnet/core/aspnet:3.1.5-alpine
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1.5

WORKDIR /app
ENTRYPOINT ["dotnet", "KubeExplorer.dll"]

COPY --from=builder /out/ .