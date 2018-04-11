FROM debian:latest
RUN apt-get update && \
    apt-get install python-minimal python-pip python-setuptools --no-install-recommends -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
ENV FLASK_APP=app.py
WORKDIR /usr/src
COPY . /usr/src/
RUN pip install -r requirements.txt
CMD ["flask", "run", "-h", "0.0.0.0"]
