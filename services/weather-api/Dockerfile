FROM mcr.microsoft.com/dotnet/sdk:8.0 as build 
 
WORKDIR /src
COPY src/*.csproj ../*.sln ./
RUN dotnet restore
 
COPY . ./
RUN dotnet build -c Release -o /app
RUN dotnet publish -o /publish

FROM mcr.microsoft.com/dotnet/aspnet:8.0 as base
COPY --from=build  /publish /app
WORKDIR /app

CMD ["./GetWeatherForecast"]