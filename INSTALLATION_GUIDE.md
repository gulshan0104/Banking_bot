# 🔧 Complete Installation Guide - Banking Bot

## 📝 Table of Contents
1. [Windows Installation](#windows-installation)
2. [macOS Installation](#macos-installation)
3. [Linux Installation](#linux-installation)
4. [Manual Verification](#manual-verification)
5. [Troubleshooting](#troubleshooting)

---

## 💻 Windows Installation

### Step 1: Install Node.js

1. Go to https://nodejs.org/
2. Download "LTS" version (18+)
3. Run the installer
4. Click "Next" through all steps
5. **IMPORTANT:** Check "Automatically install necessary tools"
6. Click "Install"
7. Verify in Command Prompt:
   ```cmd
   node --version
   npm --version
   ```

### Step 2: Install Python

1. Go to https://www.python.org/downloads/
2. Download Python 3.11 or higher
3. Run the installer
4. **IMPORTANT:** Check "Add Python to PATH" at the bottom
5. Click "Install Now"
6. Verify in Command Prompt:
   ```cmd
   python --version
   ```

### Step 3: Install MySQL

1. Go to https://dev.mysql.com/downloads/mysql/
2. Download MySQL Community Server (8.0+)
3. Run the installer
4. Choose "Setup Type: Developer Default"
5. Click "Next" through steps
6. In "MySQL Server Configuration":
   - Config Type: Development Machine
   - TCP Port: 3306
   - Named Pipe: Enable
   - Click "Next"
7. In "MySQL Server Configuration Wizard":
   - Choose "Standard Configuration"
   - Click "Next"
8. In "Windows Options":
   - Check "Install as Windows Service"
   - Service Name: MySQL80
   - Check "Launch the MySQL Server automatically"
   - Click "Next"
9. In "Security Options":
   - Set root password (write it down!)
   - For testing: you can use "root" as password
   - Click "Next"
10. Click "Execute" and then "Finish"
11. Verify in Command Prompt:
    ```cmd
    mysql --version
    mysql -u root -p
    ```

### Step 4: Install Git

1. Go to https://git-scm.com/
2. Download Git for Windows
3. Run the installer
4. Click "Next" through all steps
5. When asked about line endings, choose "Checkout as-is, commit as-is"
6. Choose "Use Windows' default console window"
7. Click "Install"
8. Verify in Command Prompt:
   ```cmd
   git --version
   ```

### Step 5: Setup Banking Bot

1. **Open Command Prompt** (Win + R, type `cmd`)

2. **Navigate to your projects folder:**
   ```cmd
   cd C:\Users\YourUsername\Documents
   ```
   Or any folder where you want the project

3. **Clone the repository:**
   ```cmd
   git clone https://github.com/gulshan0104/Banking_bot.git
   cd Banking_bot
   ```

4. **Copy environment file:**
   ```cmd
   copy .env.example .env
   ```

5. **Edit .env file:**
   - Open `.env` with Notepad
   - Update with your credentials
   - Save and close

6. **Setup Database:**
   ```cmd
   # Open MySQL
   mysql -u root -p
   ```
   
   Then paste this:
   ```sql
   CREATE DATABASE banking_db;
   CREATE USER 'banking_user'@'localhost' IDENTIFIED BY 'banking_password_123';
   GRANT ALL PRIVILEGES ON banking_db.* TO 'banking_user'@'localhost';
   FLUSH PRIVILEGES;
   EXIT;
   ```

   Then import schema:
   ```cmd
   mysql -u banking_user -p banking_db < database/schema.sql
   ```
   (Password: banking_password_123)

7. **Load sample data (optional):**
   ```cmd
   mysql -u banking_user -p banking_db < database/seeds/sample_data.sql
   ```

8. **Install Backend:**
   ```cmd
   cd backend
   npm install
   npm run dev
   ```

9. **Open new Command Prompt and start Frontend:**
   ```cmd
   cd path\to\Banking_bot\frontend
   npm install
   npm run dev
   ```

10. **Open another Command Prompt and start Chatbot:**
    ```cmd
    cd path\to\Banking_bot\chatbot
    python -m venv venv
    venv\Scripts\activate
    pip install -r requirements.txt
    python -m spacy download en_core_web_sm
    python -m nltk.downloader punkt
    python src/api.py
    ```

11. **Open Browser and visit:**
    - Frontend: http://localhost:3000
    - Backend: http://localhost:5000/api/health
    - Chatbot: http://localhost:8000/health

---

## 🍎 macOS Installation

### Step 1: Install Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Step 2: Install Node.js

```bash
brew install node
node --version
npm --version
```

### Step 3: Install Python

```bash
brew install python@3.11
python3 --version
```

### Step 4: Install MySQL

```bash
brew install mysql
mysql --version

# Start MySQL
brew services start mysql

# Set root password
mysql -u root
```

In MySQL:
```sql
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';
FLUSH PRIVILEGES;
EXIT;
```

### Step 5: Install Git

```bash
brew install git
git --version
```

### Step 6: Setup Banking Bot

```bash
# Clone repository
git clone https://github.com/gulshan0104/Banking_bot.git
cd Banking_bot

# Copy env file
cp .env.example .env

# Setup database
mysql -u root -p < database/schema.sql
mysql -u banking_user -p banking_db < database/seeds/sample_data.sql

# Terminal 1: Backend
cd backend
npm install
npm run dev

# Terminal 2: Frontend
cd frontend
npm install
npm run dev

# Terminal 3: Chatbot
cd chatbot
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
python3 -m spacy download en_core_web_sm
python3 -m nltk.downloader punkt
python3 src/api.py
```

---

## 🐧 Linux Installation (Ubuntu/Debian)

### Step 1: Update System

```bash
sudo apt update
sudo apt upgrade -y
```

### Step 2: Install Node.js

```bash
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs
node --version
npm --version
```

### Step 3: Install Python

```bash
sudo apt install -y python3 python3-venv python3-pip
python3 --version
```

### Step 4: Install MySQL

```bash
sudo apt install -y mysql-server
mysql --version

# Start MySQL
sudo systemctl start mysql

# Set root password
sudo mysql -u root
```

In MySQL:
```sql
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';
FLUSH PRIVILEGES;
EXIT;
```

### Step 5: Install Git

```bash
sudo apt install -y git
git --version
```

### Step 6: Setup Banking Bot

```bash
# Clone repository
git clone https://github.com/gulshan0104/Banking_bot.git
cd Banking_bot

# Copy env file
cp .env.example .env

# Setup database
mysql -u root -p < database/schema.sql
mysql -u banking_user -p banking_db < database/seeds/sample_data.sql

# Terminal 1: Backend
cd backend
npm install
npm run dev

# Terminal 2: Frontend
cd frontend
npm install
npm run dev

# Terminal 3: Chatbot
cd chatbot
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
python3 -m spacy download en_core_web_sm
python3 -m nltk.downloader punkt
python3 src/api.py
```

---

## ✅ Manual Verification

### Test Each Component

```bash
# Test Backend
curl http://localhost:5000/api/health

# Test Chatbot
curl http://localhost:8000/health

# Test Frontend
# Open http://localhost:3000 in browser

# Test Database
mysql -u banking_user -p banking_db
SHOW TABLES;
SELECT COUNT(*) FROM users;
EXIT;
```

---

## 🔧 Troubleshooting

### Issue: "command not found: node"

**Windows:**
- Restart Command Prompt after Node.js installation
- Check if Node.js is in PATH: `echo %PATH%`

**macOS/Linux:**
```bash
export PATH="/usr/local/bin:$PATH"
source ~/.bash_profile
node --version
```

### Issue: "Port 3000 already in use"

**Windows:**
```cmd
netstat -ano | findstr :3000
taskkill /PID <PID> /F
```

**macOS/Linux:**
```bash
lsof -i :3000
kill -9 <PID>
```

Or change port in `.env`:
```env
FRONTEND_PORT=3001
BACKEND_PORT=5001
CHATBOT_PORT=8001
```

### Issue: "MySQL connection error"

**Windows:**
- Check Services: `services.msc`
- Find "MySQL80" and start it

**macOS:**
```bash
brew services start mysql
```

**Linux:**
```bash
sudo systemctl start mysql
```

### Issue: "pip command not found"

**Windows:**
```cmd
python -m pip install --upgrade pip
```

**macOS/Linux:**
```bash
python3 -m pip install --upgrade pip
```

### Issue: "Permission denied"

**macOS/Linux:**
```bash
sudo chown -R $USER:$USER Banking_bot
chmod -R 755 Banking_bot
```

---

## 🎯 Quick Reference

### Windows Hotkeys
- Win + R: Run command
- Cmd (Command Prompt)
- PowerShell (Advanced)

### macOS Hotkeys
- Cmd + Space: Spotlight search
- Terminal.app or iTerm2

### Linux
- Ctrl + Alt + T: Open terminal
- Terminal (any distribution)

---

## 📞 Support

If you're stuck on any step:
1. Check the error message carefully
2. Google the error message
3. Check the Troubleshooting section
4. Open a GitHub issue

Good luck! 🚀