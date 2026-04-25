FROM python:3.14-slim

WORKDIR /app
COPY . .

RUN pip install fastapi uvicorn scikit-learn

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]