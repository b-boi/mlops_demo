MlOps project for detecting anomolies in infra and to rectify.

# Local test
To test this locally change directory to mlops_demo/app
create a python virtual environment using the below cmd
python3 -m venv mlop_demo
source mlop_demo/bin/activate

To deactivate the virtual env type the below in your shell in the ml_demo/app dir.
deactivate

Install all required dependencies using the requirements.txt file from mlops_demo/app with the below cmd from your shell

pip install -r requirements.txt

run the below from your shell console to activate locally
uvicorn main:app --reload

This will return Uvicorn running on http://127.0.0.1:8000 

from your browser type in the below
http://127.0.0.1:8000/

typing in http://127.0.0.1:8000/docs from your browser will take you to the interactive API docs

click on /predict -> "Try it out" and use the below test data

{
  "value": 25
}

or from your shell 

curl -X POST "http://127.0.0.1:8000/predict" \
-H "Content-Type: application/json" \
-d '{"value": 25}'

or from python create a .py file adding the below

import requests

response = requests.post(
    "http://127.0.0.1:8000/predict",
    json={"value": 25}
)

print(response.json())

the expected response should be

{
  "input": 25,
  "anomaly": false
}


Try testing with extreme values

{
  "value": 1000
}

Thi should return 

{
  "anomaly": true
}