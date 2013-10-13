# hivetech/prototype image
# A generic machine ready to be configured by ansible
# VERSION 0.0.1

# Administration
FROM ubuntu
MAINTAINER Xavier Bruhiere, xavier.bruhiere@gmail.com

# Make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

# Local settings
# Change eventually fr_FR to us_US
RUN apt-get install -y language-pack-fr
ENV LANGUAGE fr_FR.UTF-8
ENV LANG fr_FR.UTF-8
ENV LC_ALL fr_FR.UTF-8

RUN locale-gen fr_FR.UTF-8
RUN dpkg-reconfigure locales

# Common needed stuff for an efficient ansible-ready machine
RUN apt-get install -y openssh-server python python-apt python-pip build-essential gcc python-dev wget sudo git-core

RUN mkdir -p /var/run/sshd
RUN echo "root:proto" | chpasswd

# Create a normal default user (vagrant / docker images have just vagrant / root)
# #TODO I'm pretty sure there is a smarter way to do that
RUN useradd -m -d /home/prototype -g 100 -s /bin/bash prototype
RUN echo "prototype:proto" | chpasswd
RUN adduser prototype sudo
RUN groupadd prototype
RUN adduser prototype prototype

ENTRYPOINT ["/usr/sbin/sshd", "-D"]

# prototype script takes care of exposing it with -p
#EXPOSE 22:2222
