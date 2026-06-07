#!/bin/bash
# GitHub Codespace Setup Script
# This script runs automatically when creating a Codespace

echo "🚀 Setting up Banking Bot Codespace..."

# Update package manager
echo "📦 Updating packages..."
sudo apt-get update

# Install Node.js dependencies
echo "📚 Installing Node.js global packages..."
npm install -g npm
npm install -g @angular/cli

# Install Python packages globally
echo "🐍 Installing Python global packages..."
pip install --upgrade pip
pip install pipenv

# Setup environment file
echo "⚙️ Setting up environment variables..."
if [ ! -f .env ]; then
    cp .env.example .env
    echo "✅ .env file created"
else
    echo "✅ .env file already exists"
fi

# Start MySQL service
echo "🗄️ Starting MySQL service..."
sudo service mysql start
sleep 2

# Create database and user
echo "📊 Setting up database..."
mysql -u root -e "CREATE DATABASE IF NOT EXISTS banking_db;"
mysql -u root -e "CREATE USER IF NOT EXISTS 'banking_user'@'localhost' IDENTIFIED BY 'banking_password_123';"
mysql -u root -e "GRANT ALL PRIVILEGES ON banking_db.* TO 'banking_user'@'localhost';"
mysql -u root -e "FLUSH PRIVILEGES;"
echo "✅ Database created"

# Import schema
echo "📋 Importing database schema..."
mysql -u banking_user -pbanking_password_123 banking_db < database/schema.sql
echo "✅ Schema imported"

# Load sample data
echo "📝 Loading sample data..."
mysql -u banking_user -pbanking_password_123 banking_db < database/seeds/sample_data.sql
echo "✅ Sample data loaded"

# Install backend dependencies
echo "🔙 Installing backend dependencies..."
cd backend
npm install
cd ..
echo "✅ Backend dependencies installed"

# Install frontend dependencies
echo "🎨 Installing frontend dependencies..."
cd frontend
npm install
cd ..
echo "✅ Frontend dependencies installed"

# Setup Python chatbot
echo "🤖 Setting up chatbot..."
cd chatbot
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
echo "⏳ Downloading NLP models (this may take a minute)..."
python3 -m spacy download en_core_web_sm
python3 -m nltk.downloader punkt
deactivate
cd ..
echo "✅ Chatbot setup complete"

echo ""
echo "🎉 Banking Bot Codespace is ready!"
echo ""
echo "📝 Next steps:"
echo "1. Open 4 terminals (Ctrl + Shift + \`):"
echo "   Terminal 1: cd backend && npm run dev"
echo "   Terminal 2: cd frontend && npm run dev"
echo "   Terminal 3: cd chatbot && source venv/bin/activate && python3 src/api.py"
echo "   Terminal 4: mysql -u banking_user -p banking_db (password: banking_password_123)"
echo ""
echo "🌐 Your app will be available at:"
echo "   Frontend: http://localhost:3000"
echo "   Backend: http://localhost:5000/api/health"
echo "   Chatbot: http://localhost:8000/health"
echo ""
echo "🔐 Login with:"
echo "   Email: admin@bankingbot.com"
echo "   Password: admin123"
echo ""
echo "Happy coding! 🚀"
