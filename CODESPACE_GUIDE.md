# 🚀 Running Banking Bot in GitHub Codespace

## What is GitHub Codespace?

GitHub Codespace is a cloud-based development environment that runs entirely in your browser. It comes pre-installed with:
- Node.js
- Python
- Git
- And many other tools

**Advantages:**
- No local installation needed
- Works on any device with a browser
- Same environment for all developers
- Automatic backups
- Free for 120 core-hours per month

---

## ✅ Prerequisites

- GitHub account (free)
- Banking_bot repository access
- Browser (Chrome, Firefox, Safari, Edge)

---

## 🎯 Step-by-Step: Run in Codespace

### Step 1: Open Codespace

1. Go to: https://github.com/gulshan0104/Banking_bot
2. Click **Code** button (green)
3. Click **Codespaces** tab
4. Click **Create codespace on main**
5. Wait 1-2 minutes for setup

You'll see a VS Code editor in your browser! 🎉

---

### Step 2: Open Terminal

In the Codespace:
1. Press **Ctrl + `` ` ``** (backtick) or
2. Click **Terminal** → **New Terminal**

---

### Step 3: Setup Environment

```bash
# Copy environment file
cp .env.example .env
```

Edit `.env` - Update with these values:
```env
# Database
DB_HOST=localhost
DB_PORT=3306
DB_USER=banking_user
DB_PASSWORD=banking_password_123
DB_NAME=banking_db

# Backend
BACKEND_PORT=5000
NODE_ENV=development

# Frontend
FRONTEND_PORT=3000
VITE_API_URL=http://localhost:5000

# Chatbot
CHATBOT_PORT=8000

# JWT
JWT_SECRET=your_secret_key
```

---

### Step 4: Setup Database

#### 4.1 Start MySQL Service

```bash
# MySQL is pre-installed in Codespace
# Start it
sudo service mysql start

# Verify it's running
mysql --version
```

#### 4.2 Create Database & User

```bash
# Connect to MySQL (no password needed in Codespace)
mysql -u root
```

Then execute:
```sql
CREATE DATABASE banking_db;
CREATE USER 'banking_user'@'localhost' IDENTIFIED BY 'banking_password_123';
GRANT ALL PRIVILEGES ON banking_db.* TO 'banking_user'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

#### 4.3 Import Schema

```bash
mysql -u banking_user -p banking_db < database/schema.sql
# Password: banking_password_123
```

#### 4.4 Load Sample Data

```bash
mysql -u banking_user -p banking_db < database/seeds/sample_data.sql
```

---

### Step 5: Run Backend

**Open a new terminal** (Ctrl + Shift + `` ` ``)

```bash
cd backend
npm install
npm run dev
```

**You'll see:**
```
🚀 Banking Bot Backend running on port 5000
Environment: development
API URL: http://localhost:5000/api
```

Codespace will notify you about port 5000 - **Make it public**

---

### Step 6: Run Frontend

**Open another new terminal**

```bash
cd frontend
npm install
npm run dev
```

**You'll see:**
```
✔ ready in 234ms

➜  Local:   http://localhost:3000/
```

Codespace will notify you about port 3000 - **Make it public**

---

### Step 7: Run Chatbot

**Open another new terminal**

```bash
cd chatbot

# Create virtual environment
python3 -m venv venv

# Activate it
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Download NLP models
python3 -m spacy download en_core_web_sm
python3 -m nltk.downloader punkt

# Run chatbot
python3 src/api.py
```

**You'll see:**
```
INFO:     Uvicorn running on http://0.0.0.0:8000
INFO:     Application startup complete
```

Codespace will notify you about port 8000 - **Make it public**

---

## 🌍 Access Your Application

### From Codespace:

1. Click **Ports** tab at bottom
2. You'll see 3 ports:
   - **3000** (Frontend)
   - **5000** (Backend API)
   - **8000** (Chatbot)

3. Click the globe icon next to port 3000 to open frontend
4. Your app opens in new tab! 🎉

### From Browser:

Codespace provides public URLs:
```
Frontend: https://xxxx-3000.app.github.dev/
Backend:  https://xxxx-5000.app.github.dev/api/health
Chatbot:  https://xxxx-8000.app.github.dev/health
```

---

## 🔐 Login

```
Email: admin@bankingbot.com
Password: admin123
```

---

## 📊 Terminal Layout in Codespace

Your Codespace should look like:

```
┌─────────────────────────────────────────────────────┐
│  Editor (Code files)                                │
├─────────────────────────────────────────────────────┤
│ Terminal 1 │ Terminal 2 │ Terminal 3 │ Terminal 4 │
│ Backend    │ Frontend   │ Chatbot    │ Database   │
│ :5000      │ :3000      │ :8000      │ Setup      │
└─────────────────────────────────────────────────────┘
```

---

## 💾 Stop/Restart Services

### Stop All Services

Press **Ctrl + C** in each terminal

### Restart Backend

```bash
cd backend
npm run dev
```

### Restart Frontend

```bash
cd frontend
npm run dev
```

### Restart Chatbot

```bash
# In chatbot terminal
source venv/bin/activate
python3 src/api.py
```

### Restart MySQL

```bash
sudo service mysql restart
```

---

## 🔄 Persistent Data

### Database Persists When:
- ✅ Codespace is running
- ✅ You restart services
- ✅ You switch between Codespaces

### Database Resets When:
- ❌ You delete the Codespace
- ❌ Codespace auto-stops (after 30 min of inactivity)

### To Keep Data Between Codespace Restarts:

```bash
# Export database
mysql -u banking_user -p banking_db > database/backup.sql

# Commit to git
git add database/backup.sql
git commit -m "backup: Save database state"
git push

# Later, restore:
mysql -u banking_user -p banking_db < database/backup.sql
```

---

## 🔧 Codespace Configuration File

Create `.devcontainer/devcontainer.json` for automated setup:

```json
{
  "name": "Banking Bot",
  "image": "mcr.microsoft.com/devcontainers/universal:latest",
  "features": {
    "ghcr.io/devcontainers/features/github-cli:1": {},
    "ghcr.io/devcontainers/features/mysql:1": {}
  },
  "postCreateCommand": "npm install -g npm && pip install --upgrade pip",
  "forwardPorts": [3000, 5000, 8000, 3306],
  "portsAttributes": {
    "3000": {"label": "Frontend", "onAutoForward": "notify"},
    "5000": {"label": "Backend", "onAutoForward": "notify"},
    "8000": {"label": "Chatbot", "onAutoForward": "notify"},
    "3306": {"label": "MySQL", "onAutoForward": "silent"}
  }
}
```

---

## 📱 Access from Mobile

1. Open the public URL from Codespace
2. Your Banking Bot works on any device!
3. Share the link with team members

---

## ⚡ Quick Commands Reference

```bash
# Terminal commands in Codespace

# Node.js (pre-installed)
node --version
npm --version

# Python (pre-installed)
python3 --version
pip --version

# MySQL
mysql --version
sudo service mysql start
mysql -u root

# Git
git clone
git add
git commit
git push

# File operations
ls -la              # List files
cd folder           # Change directory
mkdir folder        # Create folder
rm file.txt         # Delete file
cat file.txt        # View file contents

# Process management
ps aux              # List running processes
kill -9 PID         # Kill process
lsof -i :3000       # Check port usage

# Environment
echo $PATH          # View PATH
env                 # View all environment variables

# VS Code in Codespace
Ctrl + `            # Toggle terminal
Ctrl + /            # Toggle comment
Ctrl + F            # Find
Ctrl + H            # Find and replace
Ctrl + S            # Save
Ctrl + Shift + D    # Open debug view
```

---

## 🐛 Troubleshooting in Codespace

### Issue: MySQL won't start

```bash
sudo service mysql start
sudo service mysql status

# If still fails:
sudo /etc/init.d/mysql restart
```

### Issue: Port not accessible

```bash
# Click on Ports tab
# Right-click port number
# Select "Make Public"
```

### Issue: Module not found in Python

```bash
# Make sure venv is activated
source venv/bin/activate

# Reinstall requirements
pip install -r requirements.txt
```

### Issue: npm dependencies error

```bash
# Clear cache
npm cache clean --force

# Delete node_modules
rm -rf node_modules

# Reinstall
npm install
```

### Issue: Port 3000 already in use

```bash
# Kill the process
lsof -i :3000
kill -9 <PID>

# Or change port in .env
FRONTEND_PORT=3001
```

### Issue: Database connection failed

```bash
# Check MySQL status
sudo service mysql status

# Check credentials in .env
cat .env | grep DB_

# Test connection
mysql -u banking_user -p -h localhost
```

---

## 💡 Tips & Tricks

### 1. Use VS Code Extensions in Codespace

- Click Extensions (Ctrl + Shift + X)
- Install:
  - MySQL (by cweijan)
  - Thunder Client (API testing)
  - REST Client
  - Python
  - TypeScript Vue Plugin

### 2. Debug Code

```bash
# Add to code
console.log('Debug info');

# Or use debugger
debugger;  // in JavaScript
```

### 3. Share Your Codespace

1. Click your avatar (top right)
2. Select "Codespaces"
3. Right-click your Codespace
4. Copy forwarded URL
5. Share with team members

### 4. Keyboard Shortcuts

```
Ctrl + `        Toggle terminal
Ctrl + J        Toggle panel
Ctrl + B        Toggle sidebar
Ctrl + P        Quick open file
Ctrl + Shift + P Command palette
Ctrl + F        Find
Ctrl + H        Replace
Alt + Up/Down   Move line up/down
Ctrl + /        Toggle comment
```

### 5. Sync with GitHub

```bash
# Make changes
git add .
git commit -m "Your message"
git push

# Pull updates
git pull
```

---

## 📊 Codespace Specifications

- **CPU:** 2 cores
- **RAM:** 4GB
- **Storage:** 32GB
- **Idle timeout:** 30 minutes (auto-stop)
- **Max runtime:** 4 weeks of continuous use
- **Free quota:** 120 core-hours/month

---

## 🎓 Learning Resources

- GitHub Codespaces Docs: https://docs.github.com/en/codespaces
- VS Code in Browser: https://code.visualstudio.com/docs/remote/codespaces
- Devcontainer Spec: https://containers.dev/

---

## ✅ Checklist

- [ ] Created GitHub Codespace
- [ ] Copied .env file
- [ ] Started MySQL service
- [ ] Created database and user
- [ ] Imported schema
- [ ] Started Backend (port 5000)
- [ ] Started Frontend (port 3000)
- [ ] Started Chatbot (port 8000)
- [ ] Accessed frontend via public URL
- [ ] Logged in with admin credentials
- [ ] Tested API endpoints
- [ ] Tested chatbot

---

## 🎉 You're Done!

Your Banking Bot is now running in GitHub Codespace! 

No local installation needed. 
No configuration headaches.
Just pure development in the cloud! ☁️

---

## 🆘 Need Help?

If you get stuck:

1. Check the Troubleshooting section above
2. Check terminal error messages
3. Open GitHub Issues
4. Check VS Code help (F1)
5. Search Codespaces documentation

**Happy Coding!** 🚀