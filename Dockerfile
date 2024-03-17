FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /source

COPY *.sln .
COPY StandaloneWebApi/*.csproj ./StandaloneWebApi/
RUN dotnet restore

COPY StandaloneWebApi/. ./StandaloneWebApi/
WORKDIR /source/StandaloneWebApi
RUN dotnet publish -c release -o /app

FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app

ENV ASPNETCORE_URLS=http://+:5010

COPY --from=build /app ./

EXPOSE 5010
ENTRYPOINT ["dotnet", "StandaloneWebApi.dll"]