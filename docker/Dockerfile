FROM debian:buster

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update && \
    apt-get -y install \
        python3-all dpkg-dev debhelper dh-python

# yes yes, frankendebian, i know, temporary measure until debian updates their git
RUN echo "deb http://ftp.us.debian.org/debian testing main contrib non-free" >> /etc/apt/sources.list.d/git.list \
     &&      apt-get update              \
     &&      apt-get install -y git      \
     &&      apt-get clean all
RUN rm /etc/apt/sources.list.d/git.list
