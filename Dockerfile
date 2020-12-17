FROM python:3.7

COPY . /django-example

RUN apt-get update
RUN apt-get install nodejs -y
RUN apt-get install npm -y

WORKDIR /django-example
RUN pip3 install -r requirements.txt

WORKDIR /django-example/frontend

RUN npm install
RUN npm run build

WORKDIR /django-example/backend

EXPOSE 8080

ENTRYPOINT ["python3", "manage.py", "runserver", "0.0.0.0:8080"]
