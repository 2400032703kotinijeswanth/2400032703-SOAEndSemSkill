# Spring Boot + MySQL Docker Compose Project

This project demonstrates how to run a Spring Boot application and a MySQL database using Docker Compose.

The project uses two containers:

- `app-service` – Spring Boot REST API running on port `8080`
- `app-db` – MySQL database running on port `3306`

## Requirements

Before running the project, make sure you have:

- Docker Desktop (or Docker Engine) installed
- Docker Compose v2 (`docker compose`)

## Running the Project

Open a terminal in the project directory and execute:

```bash
docker compose up -d --build
```

This command builds the application image and starts both containers in the background.

### Check Container Status

```bash
docker compose ps
```

### Test the API

Use the following command to access the API:

```bash
curl http://localhost:8080/api/data
```

You can also open this URL directly in your browser:

http://localhost:8080/api/data

### Expected Response

```json
{
  "status": "success",
  "message": "Data retrieved successfully",
  "data": [
    {"id": 1, "name": "Jeswanth"},
    {"id": 2, "name": "kotini"}
  ]
}
```

*Note: The IDs and order of records may vary if the database volume already contains data.*

### Health Check

To check the application health, visit:

http://localhost:8080/api/health

### View Container Logs

To view the application logs:

```bash
docker compose logs -f app-service
```

To view the MySQL database logs:

```bash
docker compose logs -f app-db
```

### Stop the Containers

To stop and remove the running containers:

```bash
docker compose down
```

To stop the containers and also remove the database volume:

```bash
docker compose down -v
```

**Warning:** Using `docker compose down -v` permanently deletes the stored database data.

## How It Works

Docker Compose creates a shared network between the application and database containers. The Spring Boot application connects to MySQL using the service hostname `app-db` instead of `localhost`.

A database health check helps ensure that MySQL is ready before the application container starts.

## Technologies Used

- Java
- Spring Boot
- MySQL
- Docker
- Docker Compose
- REST API
