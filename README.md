# Banking Bot - Full Stack Application

A comprehensive full-stack banking data management application with an integrated AI chatbot, built with React, Express.js, Python, and MySQL.

## 📋 Project Overview

This application allows users to:
- Store and manage banking data from various locations
- View all data in an interactive dashboard
- Query data through an integrated AI chatbot
- Access data securely with JWT/OAuth2 authentication

## 🏗️ Project Structure

```
Banking_bot/
├── frontend/                 # React + TypeScript frontend
│   ├── src/
│   │   ├── components/      # Reusable UI components
│   │   ├── pages/           # Page components
│   │   ├── services/        # API services
│   │   ├── store/           # State management (Redux/Zustand)
│   │   ├── types/           # TypeScript types
│   │   └── App.tsx
│   ├── public/
│   └── package.json
│
├── backend/                  # Express.js + Node.js backend
│   ├── src/
│   │   ├── routes/          # API routes
│   │   ├── controllers/      # Route handlers
│   │   ├── models/          # Data models
│   │   ├── middleware/      # Custom middleware (auth, etc)
│   │   ├── services/        # Business logic
│   │   ├── utils/           # Utility functions
│   │   ├── config/          # Configuration files
│   │   └── server.ts
│   ├── package.json
│   └── tsconfig.json
│
├── chatbot/                  # Python AI Chatbot
│   ├── src/
│   │   ├── models/          # ML/NLP models
│   │   ├── utils/           # Processing utilities
│   │   ├── api.py           # FastAPI server
│   │   └── training/        # Model training scripts
│   ├── requirements.txt
│   └── config.py
│
├── database/                 # MySQL Schema
│   ├── schema.sql           # Database schema
│   ├── migrations/          # Database migrations
│   └── seeds/               # Sample data
│
├── docs/                     # Documentation
│   ├── API.md               # API documentation
│   ├── SETUP.md             # Setup instructions
│   ├── DATABASE.md          # Database documentation
│   └── CHATBOT.md           # Chatbot documentation
│
├── docker/                   # Docker configuration
│   ├── Dockerfile.backend
│   ├── Dockerfile.frontend
│   ├── Dockerfile.chatbot
│   └── docker-compose.yml
│
├── .github/
│   └── workflows/           # CI/CD pipelines
│
└── .env.example             # Environment variables template
```

## 🛠️ Tech Stack

### Frontend
- **React 18** with **TypeScript**
- **Vite** for fast builds
- **Redux Toolkit** for state management
- **Axios** for HTTP requests
- **Tailwind CSS** for styling
- **Chart.js** for data visualization

### Backend
- **Express.js** with **TypeScript**
- **Node.js 18+**
- **JWT** for authentication
- **Passport.js** for OAuth2
- **MySQL2** for database operations
- **Joi** for validation

### Python Services
- **FastAPI** for chatbot API
- **scikit-learn** for NLP
- **NLTK** for natural language processing
- **spaCy** for entity recognition

### Database
- **MySQL 8.0+**
- **Sequelize** or **TypeORM** ORM

### DevOps
- **Docker & Docker Compose**
- **GitHub Actions** for CI/CD
- **Nginx** for reverse proxy

## 🚀 Quick Start

### Prerequisites
- Node.js 18+
- Python 3.9+
- MySQL 8.0+
- Docker & Docker Compose (optional)

### Installation Steps

Detailed setup instructions coming soon. See documentation for:
- [Full Setup Guide](./docs/SETUP.md)
- [Database Setup](./docs/DATABASE.md)
- [API Documentation](./docs/API.md)
- [Chatbot Setup](./docs/CHATBOT.md)

## 🔐 Security Features

- JWT-based authentication
- OAuth2 integration (Google, GitHub)
- Password encryption with bcrypt
- Input validation and sanitization
- CORS protection
- Rate limiting
- SQL injection prevention

## 📊 Key Features

- ✅ User authentication (JWT + OAuth2)
- ✅ Banking data CRUD operations
- ✅ Multi-location data support
- ✅ Interactive dashboard with analytics
- ✅ AI-powered chatbot for data queries
- ✅ Real-time data filtering and search
- ✅ Data export (CSV, PDF)
- ✅ Role-based access control (RBAC)
- ✅ Audit logging

## 📄 License

MIT License

## 👨‍💻 Author

Gulshan Kumar (gulshan0104)
