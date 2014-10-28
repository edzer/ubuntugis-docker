FROM ubuntu:12.04

# Connect to ubuntugis
RUN echo "deb http://ppa.launchpad.net/ubuntugis/ubuntugis-unstable/ubuntu precise main " >> /etc/apt/sources.list
RUN echo "deb-src http://ppa.launchpad.net/ubuntugis/ubuntugis-unstable/ubuntu precise main"  >> /etc/apt/sources.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 314DF160

RUN echo "deb http://ppa.launchpad.net/grass/grass-devel/ubuntu precise main " >> /etc/apt/sources.list
RUN echo "deb-src http://ppa.launchpad.net/grass/grass-devel/ubuntu precise main " >> /etc/apt/sources.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 26D57B27

# update apt cache and upgrade
RUN apt-get update
RUN apt-get upgrade -y

# Install Utilities
RUN apt-get install -y curl git mc build-essential python-setuptools python-dev python-pip python-software-properties

# Java
RUN apt-get install -y default-jre 

RUN pip install scikit-learn numpy gdal os sys
