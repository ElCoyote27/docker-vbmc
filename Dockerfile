FROM python:3.6
LABEL description="virtual BMC" version="1.0"
MAINTAINER github/ElCoyote27

ENV DEBIAN_FRONTEND noninteractive
ENV container docker

ENV http_proxy "http://imladris.lasthome.solace.krynn:3128"
ENV ftp_proxy "http://imladris.lasthome.solace.krynn:3128"
ENV https_proxy "http://imladris.lasthome.solace.krynn:3128"
ENV no_proxy "localhost.localdomain,localhost,127.0.0.1,.localdomain4,localhost4,.localdomain6,localhost6,.lasthome.solace.krynn"

# Workaround for issues with mirrors..
# RUN echo 'options ndots:2 timeout:2 attempts:2 single-request' >> /etc/resolv.conf
RUN echo 'Acquire::http::Proxy "http://imladris.lasthome.solace.krynn:3128";' >> /etc/apt/apt.conf.d/01-vendor-ubuntu
# RUN sed -i s/http/ftp/ /etc/apt/sources.list

RUN apt-get update --fix-missing

# Setup
USER root

RUN apt-get install -y libvirt-dev
RUN pip install virtualbmc
RUN apt-get clean

RUN rm -Rf /var/lib/apt/lists/*
RUN rm -Rf /var/cache/apt/archives/*.deb
RUN rm -Rf /var/cache/apt/archives/partial/*

CMD ["/usr/local/bin/vbmcd", "--foreground"]

