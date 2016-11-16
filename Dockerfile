FROM erikka/ubuntu:latest

MAINTAINER Erikka Baguio "erikka.baguio@gmail.com"

RUN apt-get update -y && \
    apt-get install -y python-pip python-dev

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

COPY . /app

ENTRYPOINT [ "python" ]

CMD [ "app/__init__.py" ]
CMD [ "app/views.py" ]