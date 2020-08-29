FROM ubuntu
FROM python:3

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    vim \
    graphviz-dev \
    unzip \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY requirements.txt /usr/src/app/

RUN pip3 install --upgrade pip
RUN pip3 install jupyterlab

ENV TINI_VERSION v0.6.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8888
CMD ["/usr/bin/tini","-s", "--","jupyter", "lab", "--port=8888","--no-browser", "--ip=0.0.0.0","--allow-root","--notebook-dir=/"]
