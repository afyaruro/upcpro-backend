# Usa la imagen base de ASP.NET Core Runtime 8.0 para la ejecución
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 8081

# Usa la imagen base de .NET SDK 8.0 para la compilación
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copia los archivos de solución y proyectos para restaurar dependencias
COPY ["upcpro.sln", "./"]
COPY ["Core.Domain/Core.Domain.csproj", "Core.Domain/"]
COPY ["Core.Repository/Core.Repository.csproj", "Core.Repository/"]
COPY ["Core.Service/Core.Service.csproj", "Core.Service/"]
COPY ["Infrastructure/Infrastructure.csproj", "Infrastructure/"]
COPY ["WebAPI/WebAPI.csproj", "WebAPI/"]

# Restaura las dependencias
RUN dotnet restore

# Copia el resto de los archivos del proyecto
COPY . .

# Compila el proyecto
WORKDIR "/src/WebAPI"
RUN dotnet build -c Release -o /app/build

# Publica la aplicación
FROM build AS publish
RUN dotnet publish -c Release -o /app/publish

# Usa la imagen base para ejecutar la aplicación
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "WebAPI.dll"]

