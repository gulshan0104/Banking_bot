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
│   │   ├── api.py           # Flask/FastAPI server
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

## 🚀 Getting Started

### Prerequisites
- Node.js 18+
- Python 3.9+
- MySQL 8.0+
- Docker & Docker Compose (optional)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/gulshan0104/Banking_bot.git
   cd Banking_bot
   ```

2. **Setup Database**
   ```bash
   mysql -u root -p < database/schema.sql
   ```

3. **Setup Backend**
   ```bash
   cd backend
   npm install
   npm run dev
   ```

4. **Setup Chatbot (Python)**
   ```bash
   cd chatbot
   pip install -r requirements.txt
   python src/api.py
   ```

5. **Setup Frontend**
   ```bash
   cd frontend
   npm install
   npm run dev
   ```

6. **Using Docker Compose**
   ```bash
   docker-compose up -d
   ```

## 📖 Documentation

- [API Documentation](./docs/API.md)
- [Database Schema](./docs/DATABASE.md)
- [Setup Guide](./docs/SETUP.md)
- [Chatbot Guide](./docs/CHATBOT.md)

## 🔐 Security Features

- JWT-based authentication
- OAuth2 integration (Google, GitHub)
- Password encryption with bcrypt
- Input validation and sanitization
- CORS protection
- Rate limiting
- SQL injection prevention

## 📊 Features

- ✅ User authentication (JWT + OAuth2)
- ✅ Banking data CRUD operations
- ✅ Multi-location data support
- ✅ Interactive dashboard with analytics
- ✅ AI-powered chatbot for data queries
- ✅ Real-time data filtering and search
- ✅ Data export (CSV, PDF)
- ✅ Role-based access control (RBAC)
- ✅ Audit logging

## 🧪 Testing

```bash
# Backend tests
cd backend
npm run test

# Frontend tests
cd frontend
npm run test

# Integration tests
npm run test:e2e
```

## 📝 Environment Variables

See `.env.example` for required environment variables.

## 🤝 Contributing

1. Create a feature branch
2. Make your changes
3. Submit a pull request

## 📄 License

MIT License

## 👨‍💻 Author

Gulshan Kumar (gulshan0104)

## 📧 Support

For questions or issues, please open a GitHub issue.