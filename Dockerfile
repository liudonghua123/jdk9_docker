############################################################
# Dockerfile to build JDK9 container images
# Based on Ubuntu
# Ref: repo.spring.io/libs-release/org/springframework/boot
# Ref: http://www.webupd8.org/2012/09/install-oracle-java-8-in-ubuntu-via-ppa.html
# Ref: http://www.webupd8.org/2015/02/install-oracle-java-9-in-ubuntu-linux.html
############################################################

# Set the base image to Ubuntu
FROM ubuntu

# File Author / Maintainer
MAINTAINER Liudonghua <liudonghua123@gmail.com>

# Update the repository sources list
RUN apt-get update

################## BEGIN INSTALLATION ######################

# Install some prerequisites like add-apt-repository
RUN apt-get install -y python-software-properties software-properties-common

# Add ppa repository
RUN add-apt-repository -y ppa:webupd8team/java

# Update the repository sources list once more
RUN apt-get update

# Auto accept the license
RUN echo oracle-java9-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections

# Install JDK9
RUN apt-get install -y oracle-java9-installer

# Setting Java environment variables
RUN apt-get install -y oracle-java9-set-default

##################### INSTALLATION END #####################

##################### BEGIN CLEANUP #####################
RUN apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
##################### CLEANUP END #####################

# The main entrypoint
CMD /bin/bash
