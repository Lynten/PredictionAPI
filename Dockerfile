# Base
FROM ubuntu:18.04
MAINTAINER Nawfal Tachfine

# Ali mirrors
COPY sources.list /etc/apt/sources.list
COPY pip.conf /root/.pip/pip.conf

# Package dependencies
RUN apt-get update &&\
    apt-get install -y python3-dev &&\
    apt-get install -y python3-pip &&\
    apt-get install -y python3-numpy &&\
    apt-get install -y python3-scipy

# Python libraries
ADD requirements.txt /src/requirements.txt
RUN pip3 install -r /src/requirements.txt

# Source code
ADD . /src
WORKDIR /src

# Network interfaces
EXPOSE 5000

# Application
CMD ["python3", "application.py"]
