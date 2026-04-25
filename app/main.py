import boto3
import pandas as pd
from sklearn.ensemble import IsolationForest
import joblib

# Dummy dataset (replace with S3 load)
data = pd.DataFrame({"latency": [10,20,30,100,200]})

model = IsolationForest(contamination=0.1)
model.fit(data)

joblib.dump(model, "model.joblib")

# Upload to S3
s3 = boto3.client("s3")
s3.upload_file("model.joblib", "YOUR_BUCKET", "model.joblib")