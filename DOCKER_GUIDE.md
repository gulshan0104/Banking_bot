# 🐳 Docker Setup Guide - Banking Bot

## Prerequisites

### Install Docker Desktop

#### Windows
1. Download: https://www.docker.com/products/docker-desktop
2. Run installer
3. Check "Install required Windows components for WSL2"
4. Restart computer
5. Verify: `docker --version`

#### macOS
1. Download: https://www.docker.com/products/docker-desktop
2. Run installer
3. Drag Docker to Applications
4. Launch Docker from Applications
5. Verify: `docker --version`

#### Linux (Ubuntu)
```bash
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER
newgrp docker

# Install Docker Compose
sudo apt install docker-compose

# Verify
docker --version
docker-compose --version
```

---

## 🚀 Quick Start with Docker

### 1. Navigate to Project

```bash
cd Banking_bot
```

### 2. Start All Services

```bash
docker-compose -f docker/docker-compose.yml up -d
```

**Expected output:**
```
Creating banking-db ... done
Creating banking-backend ... done
Creating banking-chatbot ... done
Creating banking-frontend ... done
```

### 3. Access Services

- Frontend: http://localhost:3000
- Backend API: http://localhost:5000/api/health
- Chatbot: http://localhost:8000/health
- MySQL: localhost:3306

---

## 📊 Common Docker Commands

### View Running Services

```bash
docker-compose -f docker/docker-compose.yml ps
```

### View Logs

```bash
# All services
docker-compose -f docker/docker-compose.yml logs -f

# Specific service
docker-compose -f docker/docker-compose.yml logs -f backend
docker-compose -f docker/docker-compose.yml logs -f frontend
docker-compose -f docker/docker-compose.yml logs -f chatbot
docker-compose -f docker/docker-compose.yml logs -f mysql
```

### Stop Services

```bash
docker-compose -f docker/docker-compose.yml down
```

### Restart Services

```bash
docker-compose -f docker/docker-compose.yml restart
```

### Stop Specific Service

```bash
docker-compose -f docker/docker-compose.yml stop backend
docker-compose -f docker/docker-compose.yml stop frontend
docker-compose -f docker/docker-compose.yml stop chatbot
```

### Start Specific Service

```bash
docker-compose -f docker/docker-compose.yml start backend
```

### Remove All Containers and Volumes

```bash
docker-compose -f docker/docker-compose.yml down -v
```

---

## 🔍 Debugging Docker

### Check Service Health

```bash
# Get container ID
docker-compose -f docker/docker-compose.yml ps

# Run command inside container
docker exec <container_id> command

# Example: Check MySQL
docker exec banking-db mysql -u banking_user -pbanking_password -e "SHOW DATABASES;"
```

### View Container Logs in Real-time

```bash
docker logs -f <container_id>

# Example
docker logs -f banking-backend
```

### Execute Interactive Shell

```bash
# Connect to container terminal
docker exec -it <container_id> /bin/bash

# Example
docker exec -it banking-backend /bin/bash
```

---

## 🛠️ Modify Docker Configuration

### Edit docker-compose.yml

**To change ports:**

```yaml
services:
  backend:
    ports:
      - "5001:5000"  # Changed from 5000 to 5001
  
  frontend:
    ports:
      - "3001:3000"  # Changed from 3000 to 3001
  
  chatbot:
    ports:
      - "8001:8000"  # Changed from 8000 to 8001
```

**To change environment variables:**

```yaml
services:
  backend:
    environment:
      BACKEND_PORT: 5001
      NODE_ENV: production
```

### Rebuild Services After Changes

```bash
# Rebuild all
docker-compose -f docker/docker-compose.yml up -d --build

# Rebuild specific service
docker-compose -f docker/docker-compose.yml up -d --build backend
```

---

## 📦 Individual Docker Commands

### Build Individual Dockerfile

```bash
# Backend
cd backend
docker build -f ../docker/Dockerfile.backend -t banking-bot-backend .

# Frontend
cd frontend
docker build -f ../docker/Dockerfile.frontend -t banking-bot-frontend .

# Chatbot
cd chatbot
docker build -f ../docker/Dockerfile.chatbot -t banking-bot-chatbot .
```

### Run Individual Container

```bash
docker run -d \
  --name banking-backend \
  -p 5000:5000 \
  -e DB_HOST=localhost \
  -e DB_USER=banking_user \
  banking-bot-backend
```

---

## 🌐 Network Configuration

Services communicate via a custom network called `banking-network`:

```bash
# List networks
docker network ls

# Inspect network
docker network inspect banking-network

# Check service connectivity
docker exec banking-backend ping banking-db
docker exec banking-backend curl http://banking-chatbot:8000/health
```

---

## 💾 Database Backup with Docker

### Backup Database

```bash
docker exec banking-db mysqldump -u banking_user -pbanking_password banking_db > backup.sql
```

### Restore Database

```bash
docker exec -i banking-db mysql -u banking_user -pbanking_password banking_db < backup.sql
```

---

## 🔐 Security Tips

### Change Default Passwords

Edit `docker/docker-compose.yml`:

```yaml
environment:
  MYSQL_ROOT_PASSWORD: secure_password_123
  MYSQL_PASSWORD: secure_password_456
```

### Update Environment Variables

Edit `.env` and rebuild:

```bash
docker-compose -f docker/docker-compose.yml up -d --build
```

### Don't Expose Ports in Production

Remove port mappings for internal services:

```yaml
services:
  mysql:
    # Remove ports section for production
    # ports:
    #   - "3306:3306"
```

---

## 🚨 Troubleshooting Docker

### Container Won't Start

```bash
# Check logs
docker-compose -f docker/docker-compose.yml logs backend

# Check if port is in use
docker ps -a | grep 5000

# Remove container and restart
docker-compose -f docker/docker-compose.yml down
docker-compose -f docker/docker-compose.yml up -d
```

### Database Connection Failed

```bash
# Check MySQL container health
docker-compose -f docker/docker-compose.yml ps mysql

# Wait for MySQL to be ready (may take 30 seconds)
# Check health check status: "health: starting" → "health: healthy"

# Verify network connectivity
docker exec banking-backend ping banking-db
```

### Out of Disk Space

```bash
# Clean up unused images and volumes
docker system prune -a

# Remove specific volume
docker volume rm banking_bot_mysql_data
```

### Port Already in Use

**Windows:**
```cmd
netstat -ano | findstr :5000
taskkill /PID <PID> /F
```

**macOS/Linux:**
```bash
lsof -i :5000
kill -9 <PID>
```

Or change ports in `docker-compose.yml`.

### Permission Denied

**Linux:**
```bash
sudo usermod -aG docker $USER
newgrp docker
```

---

## 📈 Performance Optimization

### Limit Resource Usage

```yaml
services:
  backend:
    deploy:
      resources:
        limits:
          cpus: '0.5'
          memory: 512M
        reservations:
          cpus: '0.25'
          memory: 256M
```

### Use Named Volumes

```yaml
volumes:
  mysql_data:
    driver: local
```

---

## 📚 Useful Docker Resources

- Docker Docs: https://docs.docker.com/
- Docker Hub: https://hub.docker.com/
- Docker Compose Docs: https://docs.docker.com/compose/
- Docker CLI Reference: https://docs.docker.com/engine/reference/commandline/cli/

---

## ✅ Verify Docker Setup

```bash
# Start services
docker-compose -f docker/docker-compose.yml up -d

# Wait 30 seconds for services to initialize
sleep 30

# Check all services
docker-compose -f docker/docker-compose.yml ps

# Test endpoints
curl http://localhost:5000/api/health
curl http://localhost:8000/health

# Open browser
# http://localhost:3000

# View logs if needed
docker-compose -f docker/docker-compose.yml logs -f
```

All services should show healthy status! 🎉