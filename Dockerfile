FROM tensorflow/tensorflow-gpu:2.7.0

WORKDIR ./code

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY src/ .
