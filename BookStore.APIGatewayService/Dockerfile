# Setting the Base Image
FROM microsoft/aspnetcore:latest

# Copies the files from a folder called dist into a folder called /app in the container
COPY dist /app

# Setting the Working Directory
WORKDIR /app

# Exposing the HTTP Port
EXPOSE 80/tcp

# Running the Application
ENTRYPOINT ["dotnet", "BookStore.APIGatewayService.dll"]