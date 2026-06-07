from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
import os
from dotenv import load_dotenv
import uvicorn

load_dotenv()

app = FastAPI(
    title="Banking Bot - AI Chatbot",
    description="AI Chatbot for banking data queries",
    version="1.0.0"
)

# CORS Configuration
app.add_middleware(
    CORSMiddleware,
    allow_origins=[os.getenv("CORS_ORIGIN", "http://localhost:3000")],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Pydantic Models
class MessageRequest(BaseModel):
    conversation_id: int
    message: str
    user_id: int

class MessageResponse(BaseModel):
    response: str
    confidence_score: float
    entity_data: dict = {}

# Health Check
@app.get("/health")
async def health_check():
    return {
        "status": "OK",
        "message": "Banking Bot Chatbot API is running"
    }

# Message Processing Endpoint
@app.post("/message", response_model=MessageResponse)
async def process_message(request: MessageRequest):
    """
    Process user message and return chatbot response
    """
    try:
        # Message processing will be implemented
        return MessageResponse(
            response="I'm ready to help with your banking queries!",
            confidence_score=0.95,
            entity_data={}
        )
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

# Conversation History
@app.get("/conversations/{conversation_id}")
async def get_conversation(conversation_id: int):
    return {"message": "Conversation endpoint ready"}

if __name__ == "__main__":
    uvicorn.run(
        app,
        host="0.0.0.0",
        port=int(os.getenv("CHATBOT_PORT", 8000))
    )