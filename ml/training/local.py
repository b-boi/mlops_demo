from fastapi import FastAPI
import numpy as np
from sklearn.ensemble import IsolationForest
from pydantic import BaseModel
import logging

## N.B Use local.py to run a local simulated log creation 
# for the ml pipeline
 

app = FastAPI()

# Define request body properly (important!)
class InputData(BaseModel):
    value: float

# Dummy trained model (replace later with S3 model load)
model = IsolationForest(contamination=0.1)
model.fit([[10], [20], [30], [40], [50]])

@app.get("/")
def health():
    return {"status": "ok"}

@app.post("/predict")
def predict(value: float):
    pred = model.predict([[value]])
    return {
        "input": value,
        "anomaly": bool(pred[0] == -1)
    }


#Adds logging to ml pipeline
logging.basicConfig(level=logging.INFO)

@app.post("/predict")
def predict(data: InputData):
    logging.info(f"Received value: {data.value}")
    pred = model.predict([[data.value]])
    return {"input": data.value, "anomaly": bool(pred[0] == -1)}