import express, { Express } from 'express';
import cors from 'cors';
import helmet from 'helmet';
import morgan from 'morgan';
import rateLimit from 'express-rate-limit';
import dotenv from 'dotenv';

dotenv.config();

const app: Express = express();
const PORT = process.env.BACKEND_PORT || 5000;

// Middleware
app.use(helmet());
app.use(cors({
  origin: process.env.CORS_ORIGIN || 'http://localhost:3000',
  credentials: true
}));

app.use(morgan('combined'));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

const limiter = rateLimit({
  windowMs: 15 * 60 * 1000,
  max: 100
});
app.use('/api/', limiter);

// Health check
app.get('/api/health', (req, res) => {
  res.json({
    status: 'OK',
    message: 'Banking Bot API is running',
    timestamp: new Date().toISOString()
  });
});

// API Routes
app.get('/api/users', (req, res) => {
  res.json({ message: 'Get all users - endpoint ready' });
});

app.post('/api/auth/register', (req, res) => {
  res.json({ message: 'Register endpoint - ready' });
});

app.post('/api/auth/login', (req, res) => {
  res.json({ message: 'Login endpoint - ready' });
});

app.get('/api/banking/accounts', (req, res) => {
  res.json({ message: 'Get accounts - ready' });
});

app.post('/api/banking/accounts', (req, res) => {
  res.json({ message: 'Create account - ready' });
});

app.get('/api/banking/transactions', (req, res) => {
  res.json({ message: 'Get transactions - ready' });
});

app.post('/api/chatbot/message', (req, res) => {
  res.json({ message: 'Send chatbot message - ready' });
});

app.get('/api/chatbot/conversations', (req, res) => {
  res.json({ message: 'Get conversations - ready' });
});

app.listen(PORT, () => {
  console.log(`\n🚀 Banking Bot Backend running on port ${PORT}`);
  console.log(`Environment: ${process.env.NODE_ENV || 'development'}`);
  console.log(`API URL: http://localhost:${PORT}/api`);
  console.log(`Health Check: http://localhost:${PORT}/api/health\n`);
});

export default app;