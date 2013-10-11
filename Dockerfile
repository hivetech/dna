# hivetech/prototype image
# A generic machine ready to be configured by ansible
# VERSION 0.0.1

FROM ubuntu
MAINTAINER Xavier Bruhiere, xavier.bruhiere@gmail.com

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y language-pack-en
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN locale-gen en_US.UTF-8
RUN dpkg-reconfigure locales

#RUN apt-get install -y openssh-server python build-essential make gcc python-dev wget 
# Common needed stuff for an efficient ansible-ready machine
RUN apt-get install -y openssh-server python python-apt python-pip build-essential gcc python-dev

#RUN wget https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py
#RUN python ez_setup.py

#RUN wget https://raw.github.com/pypa/pip/master/contrib/get-pip.py 
#RUN python get-pip.py

#RUN apt-get install -y python-apt
RUN mkdir -p /var/run/sshd
RUN echo "root:prototype" | chpasswd

ENTRYPOINT ["/usr/sbin/sshd", "-D"]

# prototype script takes care of exposing it with -p
#EXPOSE 22:2222
