# Banking Bot - Quick Start Guide

## 🎯 Complete Setup Instructions for Local Development

### Prerequisites Installation

#### 1. Install Node.js (18+)
- Download from: https://nodejs.org/
- Choose "LTS" version
- Verify installation:
  ```bash
  node --version
  npm --version
  ```

#### 2. Install Python (3.9+)
- Download from: https://www.python.org/
- **Important:** Check "Add Python to PATH" during installation
- Verify installation:
  ```bash
  python --version
  ```

#### 3. Install MySQL (8.0+)
- Download from: https://www.mysql.com/downloads/mysql/
- Choose appropriate installer for your OS
- During installation:
  - Set port: 3306
  - Set root password (remember it!)
  - Configure MySQL as service
- Verify installation:
  ```bash
  mysql --version
  ```

#### 4. Install Git (if not already installed)
- Download from: https://git-scm.com/
- Verify installation:
  ```bash
  git --version
  ```

---

## 📋 Step-by-Step Setup

### Step 1: Clone the Repository

```bash
# Navigate to where you want the project
cd your/desired/location

# Clone the repository
git clone https://github.com/gulshan0104/Banking_bot.git
cd Banking_bot
```

### Step 2: Setup Environment Variables

```bash
# Copy example env file
cp .env.example .env
```

**Edit `.env` file with your values:**

```env
# Database Configuration
DB_HOST=localhost
DB_PORT=3306
DB_USER=banking_user
DB_PASSWORD=banking_password_123
DB_NAME=banking_db

# Backend Configuration
BACKEND_PORT=5000
BACKEND_URL=http://localhost:5000
NODE_ENV=development

# JWT Configuration
JWT_SECRET=your_jwt_secret_key_change_in_production
JWT_EXPIRY=7d

# Frontend Configuration
FRONTEND_PORT=3000
FRONTEND_URL=http://localhost:3000
VITE_API_URL=http://localhost:5000

# Chatbot Configuration
CHATBOT_PORT=8000
CHATBOT_URL=http://localhost:8000
PYTHON_ENV=development

# CORS Configuration
CORS_ORIGIN=http://localhost:3000
```

### Step 3: Setup Database

#### 3.1 Create MySQL User

```bash
# Open MySQL command line
mysql -u root -p
```

**Enter your MySQL root password, then run:**

```sql
-- Create database
CREATE DATABASE banking_db;

-- Create user
CREATE USER 'banking_user'@'localhost' IDENTIFIED BY 'banking_password_123';

-- Grant privileges
GRANT ALL PRIVILEGES ON banking_db.* TO 'banking_user'@'localhost';

-- Apply changes
FLUSH PRIVILEGES;

-- Exit MySQL
EXIT;
```

#### 3.2 Import Database Schema

```bash
# From Banking_bot directory
mysql -u banking_user -p banking_db < database/schema.sql
```

**When prompted, enter:** `banking_password_123`

#### 3.3 (Optional) Load Sample Data

```bash
mysql -u banking_user -p banking_db < database/seeds/sample_data.sql
```

**When prompted, enter:** `banking_password_123`

---

## 🚀 Running the Application

### Method 1: Run Locally (Recommended for Development)

**You need 4 terminal windows/tabs for this method**

#### Terminal 1: Backend API

```bash
cd Banking_bot/backend

# Install dependencies (first time only)
npm install

# Start development server
npm run dev
```

**Expected output:**
```
🚀 Banking Bot Backend running on port 5000
Environment: development
API URL: http://localhost:5000/api
Health Check: http://localhost:5000/api/health
```

#### Terminal 2: Frontend

```bash
cd Banking_bot/frontend

# Install dependencies (first time only)
npm install

# Start development server
npm run dev
```

**Expected output:**
```
  VITE v5.0.8  ready in 123 ms
  ➜  Local:   http://localhost:3000/
  ➜  press h to show help
```

#### Terminal 3: Chatbot (Python)

```bash
cd Banking_bot/chatbot

# Create virtual environment (first time only)
python -m venv venv

# Activate virtual environment
# On Windows:
venv\Scripts\activate

# On macOS/Linux:
source venv/bin/activate

# Install dependencies (first time only)
pip install -r requirements.txt

# Download NLP models (first time only)
python -m spacy download en_core_web_sm
python -m nltk.downloader punkt

# Start chatbot server
python src/api.py
```

**Expected output:**
```
INFO:     Uvicorn running on http://0.0.0.0:8000
INFO:     Application startup complete
```

#### Terminal 4: Open the App

```bash
# After all above servers are running, open browser
# Open http://localhost:3000
```

---

### Method 2: Run with Docker (Recommended for Production)

#### Prerequisites:
- Install Docker: https://www.docker.com/products/docker-desktop
- Verify: `docker --version`
- Verify: `docker-compose --version`

#### Run with Docker Compose:

```bash
# Navigate to Banking_bot directory
cd Banking_bot

# Start all services
docker-compose -f docker/docker-compose.yml up -d

# View logs
docker-compose -f docker/docker-compose.yml logs -f

# Stop all services
docker-compose -f docker/docker-compose.yml down
```

**Services will be available at:**
- Frontend: http://localhost:3000
- Backend: http://localhost:5000/api/health
- Chatbot: http://localhost:8000/health
- MySQL: localhost:3306

---

## ✅ Verification

### Check if Everything is Running

```bash
# Check Backend
curl http://localhost:5000/api/health
# Should return: {"status":"OK","message":"Banking Bot API is running"...}

# Check Chatbot
curl http://localhost:8000/health
# Should return: {"status":"OK","message":"Banking Bot Chatbot API is running"}

# Check Frontend
# Open http://localhost:3000 in browser
# Should see: Banking Bot Dashboard
```

---

## 🔐 Test Login

After everything is running, test with the sample admin user:

```
Email: admin@bankingbot.com
Password: admin123
Role: Admin
```

Or use one of the sample users:
```
Email: john@example.com
Password: admin123 (same hash)

Email: jane@example.com
Password: admin123

Email: mike@example.com
Password: admin123
```

---

## 📁 Project Structure Overview

```
Banking_bot/
├── backend/                    # Express.js + TypeScript API
│   ├── src/
│   │   ├── server.ts          # Main server file
│   │   ├── config/            # Configuration files
│   │   ├── middleware/        # Auth, error handling
│   │   └── routes/            # API routes
│   ├── package.json
│   └── tsconfig.json
│
├── frontend/                   # React + Vite dashboard
│   ├── src/
│   │   ├── App.tsx            # Main component
│   │   ├── main.tsx           # Entry point
│   │   └── index.css          # Styles
│   ├── index.html
│   ├── package.json
│   └── vite.config.ts
│
├── chatbot/                    # Python FastAPI chatbot
│   ├── src/
│   │   ├── api.py             # Main server
│   │   ├── models/            # NLP models
│   │   └── utils/             # Utilities
│   ├── config.py
│   └── requirements.txt
│
├── database/                   # MySQL schemas
│   ├── schema.sql             # Database structure
│   ├── migrations/            # Schema changes
│   └── seeds/                 # Sample data
│
├── docker/                     # Docker configuration
│   ├── docker-compose.yml     # All services
│   ├── Dockerfile.backend
│   ├── Dockerfile.frontend
│   └── Dockerfile.chatbot
│
├── docs/                       # Documentation
│   ├── SETUP.md
│   ├── API.md
│   ├── DATABASE.md
│   └── CHATBOT.md
│
├── .env.example               # Environment template
├── .gitignore
├── README.md
└── QUICK_START.md             # This file
```

---

## 🐛 Troubleshooting

### Problem: "MySQL connection error"

**Solution:**
```bash
# Check if MySQL is running
# Windows: Check Services app
# macOS: brew services list
# Linux: sudo systemctl status mysql

# Verify credentials in .env
# Test connection:
mysql -u banking_user -p -h localhost banking_db
```

### Problem: "Port already in use" (5000, 3000, or 8000)

**Solution:**
```bash
# Change ports in .env
BACKEND_PORT=5001
FRONTEND_PORT=3001
CHATBOT_PORT=8001

# Then restart servers
```

### Problem: "npm command not found"

**Solution:**
```bash
# Reinstall Node.js from https://nodejs.org/
# Make sure to check "Add to PATH" during installation
# Restart terminal/computer
```

### Problem: "Python module not found"

**Solution:**
```bash
# Make sure virtual environment is activated
# Windows:
venv\Scripts\activate

# macOS/Linux:
source venv/bin/activate

# Then reinstall:
pip install -r requirements.txt
```

### Problem: "Database already exists"

**Solution:**
```bash
# Drop and recreate (WARNING: deletes all data)
mysql -u root -p -e "DROP DATABASE banking_db;"

# Then re-import schema
mysql -u banking_user -p banking_db < database/schema.sql
```

---

## 🎓 Common Commands

```bash
# Backend
npm run dev           # Start development
npm run build         # Build for production
npm test              # Run tests
npm run lint          # Check code style

# Frontend
npm run dev           # Start development
npm run build         # Build for production
npm run preview       # Preview production build
npm run lint          # Check code style

# Chatbot (Python)
python src/api.py     # Start server
python -m venv venv   # Create virtual environment
source venv/bin/activate  # Activate virtual environment (macOS/Linux)
venv\Scripts\activate # Activate virtual environment (Windows)

# Database
mysql -u root -p      # Connect to MySQL
show databases;       # List all databases
use banking_db;       # Switch to banking_db
show tables;          # List all tables

# Docker
docker-compose up -d           # Start all services
docker-compose logs -f         # View logs
docker-compose down            # Stop all services
docker-compose ps              # List running services
```

---

## 📚 Next Steps

1. **Explore the code** in each directory
2. **Implement authentication** in backend
3. **Create dashboard components** in frontend
4. **Build chatbot intents** in Python
5. **Test API endpoints** using Postman or curl
6. **Deploy to production** using Docker

---

## 🆘 Need Help?

- **Backend issues?** Check `backend/src/`
- **Frontend issues?** Check `frontend/src/`
- **Chatbot issues?** Check `chatbot/src/`
- **Database issues?** Check `database/schema.sql`
- **Deployment issues?** Check `docker/docker-compose.yml`

---

## 🎉 You're All Set!

Your Banking Bot is now ready for development. Start with the Quick Start section and follow each step carefully.

Happy coding! 🚀