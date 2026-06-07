# Banking Bot - Chatbot Documentation

## Features
- Natural language understanding
- Intent recognition
- Entity extraction
- Real-time data querying
- Confidence scoring

## Example Queries

### Balance Query
"What is my account balance?"

### Transaction Query
"Show me my recent transactions"

### Location-based
"Show all accounts in New York"

### Statistics
"What's my total balance?"

## API

### Send Message
```bash
POST /message
Content-Type: application/json

{
  "conversation_id": 1,
  "message": "What is my balance?",
  "user_id": 1
}
```

### Get Conversations
```bash
GET /conversations
```

## Training
Add training data in `src/training/data.json` and run:
```bash
python src/training/train_model.py
```