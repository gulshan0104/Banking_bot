# Banking Bot - Setup Guide

## Prerequisites
- Node.js 18+
- Python 3.9+
- MySQL 8.0+
- Git

## Quick Start

### 1. Clone Repository
```bash
git clone https://github.com/gulshan0104/Banking_bot.git
cd Banking_bot
cp .env.example .env
```

### 2. Database Setup
```bash
mysql -u root -p < database/schema.sql
mysql -u banking_user -p banking_db < database/seeds/sample_data.sql
```

### 3. Backend Setup
```bash
cd backend
npm install
npm run build
npm run dev
```

### 4. Frontend Setup
```bash
cd frontend
npm install
npm run dev
```

### 5. Chatbot Setup
```bash
cd chatbot
python -m venv venv
source venv/bin/activate  # Windows: venv\\Scripts\\activate
pip install -r requirements.txt
python src/api.py
```

## Docker Setup
```bash
docker-compose -f docker/docker-compose.yml up -d
```

## Access
- Frontend: http://localhost:3000
- Backend: http://localhost:5000/api/health
- Chatbot: http://localhost:8000/health
- Database: localhost:3306