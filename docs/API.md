# Banking Bot - API Documentation

## Base URL
http://localhost:5000/api

## Endpoints

### Authentication
- POST /auth/register
- POST /auth/login
- POST /auth/logout
- POST /auth/refresh-token

### Banking Data
- GET /banking/accounts
- POST /banking/accounts
- GET /banking/accounts/:id
- PUT /banking/accounts/:id
- DELETE /banking/accounts/:id
- GET /banking/transactions

### Chatbot
- POST /chatbot/message
- GET /chatbot/conversations
- GET /chatbot/conversations/:id

## Example Requests

### Login
```bash
curl -X POST http://localhost:5000/api/auth/login \\
  -H "Content-Type: application/json" \\
  -d '{"email":"user@example.com","password":"password"}'
```

### Get Accounts
```bash
curl -X GET http://localhost:5000/api/banking/accounts \\
  -H "Authorization: Bearer <token>"
```

### Send Chatbot Message
```bash
curl -X POST http://localhost:8000/message \\
  -H "Content-Type: application/json" \\
  -d '{"conversation_id":1,"message":"What is my balance?","user_id":1}'
```