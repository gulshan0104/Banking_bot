import os
from dotenv import load_dotenv

load_dotenv()

class Config:
    """Chatbot Configuration"""
    DEBUG = os.getenv("DEBUG", False)
    PYTHON_ENV = os.getenv("PYTHON_ENV", "development")
    
    # API Configuration
    CHATBOT_PORT = int(os.getenv("CHATBOT_PORT", 8000))
    CORS_ORIGIN = os.getenv("CORS_ORIGIN", "http://localhost:3000")
    BACKEND_URL = os.getenv("BACKEND_URL", "http://localhost:5000")
    
    # Database Configuration
    DB_HOST = os.getenv("DB_HOST", "localhost")
    DB_PORT = int(os.getenv("DB_PORT", 3306))
    DB_USER = os.getenv("DB_USER", "banking_user")
    DB_PASSWORD = os.getenv("DB_PASSWORD")
    DB_NAME = os.getenv("DB_NAME", "banking_db")
    
    # Chatbot Configuration
    MODEL_NAME = "banking_bot_model"
    CONFIDENCE_THRESHOLD = 0.7
    MAX_RESPONSE_LENGTH = 1000
    
    # NLP Configuration
    ENABLE_SPACY = True
    SPACY_MODEL = "en_core_web_sm"
    ENABLE_NLTK = True