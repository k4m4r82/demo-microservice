## Demo Microservice

Ini adalah contoh microservice yang sudah menggunakan API Gateway dan Message Broker untuk komunikasi antar microservicenya.

### Pre-requisites

* Visual Studio 2017 15.3+
* Docker

### Cara deploy ke docker

1. Build Project

```
> dotnet publish BookStore.APIGatewayService/BookStore.APIGatewayService.csproj --framework netcoreapp2.0 --configuration Release --output dist
> dotnet publish BookStore.BookCatalogService/BookStore.BookCatalogService.csproj --framework netcoreapp2.0 --configuration Release --output dist
> dotnet publish BookStore.CustomerService/BookStore.CustomerService.csproj --framework netcoreapp2.0 --configuration Release --output dist
> dotnet publish BookStore.OrderService/BookStore.OrderService.csproj --framework netcoreapp2.0 --configuration Release --output dist
```

2. Membuat dan Menjalankan Service Docker

```
> docker-compose build
> docker-compose up -d
```

3. Mengakses service melalui api gateway

Setelah service docker berjalan, api gateway bisa di akses melalui url: http://localhost:9000/