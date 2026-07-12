from fastapi import FastAPI
from datetime import datetime

app = FastAPI(title="Test App for Autodeploy")

@app.get("/")
def root():
    return {"message": "🚀 Автодеплой работает! v2"}

@app.get("/health")
def health():
    return {"status": "healthy"}

@app.get("/date")
def date():
    return {"current_date": datetime.now().isoformat()}