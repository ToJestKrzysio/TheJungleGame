FROM tensorflow/tensorflow:2.7.0-gpu

WORKDIR /code

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

ENV FLASK_APP="server/app"

CMD ["python", "server/app.py"]
