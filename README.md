# Dockerized Strapi with PostgreSQL and Nginx

## Overview

This project demonstrates running Strapi CMS with PostgreSQL in a Dockerized environment using Docker Compose. Nginx is configured as a reverse proxy to route requests from port 80 to the Strapi application running on port 1337.

---

## Architecture

Nginx (Port 80) → Strapi (Port 1337) → PostgreSQL

All containers run inside a user-defined Docker network:

```
strapi-net
```

---

## Setup Instructions

### 1. Clone the repository

```
git clone <repo-url>
cd strapi-docker-setup
```

### 2. Start containers

```
docker compose up -d
```

### 3. Verify running containers

```
docker ps
```

### 4. Access Strapi

Open in browser:

```
http://localhost/admin
```

Create the admin account to finish setup.

---

## Environment Configuration

PostgreSQL container variables:

```
POSTGRES_USER=strapiuser
POSTGRES_PASSWORD=strapipassword
POSTGRES_DB=strapidb
```

Strapi database connection variables:

```
DATABASE_CLIENT=postgres
DATABASE_HOST=postgres
DATABASE_PORT=5432
DATABASE_NAME=strapidb
DATABASE_USERNAME=strapiuser
DATABASE_PASSWORD=strapipassword
```

---

## Docker Network

User-defined network:

```
strapi-net
```

All services connected:

* postgres
* strapi
* nginx

---

## Reverse Proxy

Nginx proxies requests from:

```
http://localhost
```

to:

```
http://strapi:1337
```

---

## Stop Environment

```
docker compose down
```

## Loom Link
```
https://www.loom.com/share/8c420db3ac604d72ad941113d5ea4960
```

