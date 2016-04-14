FROM nginx

MAINTAINER Joost Cassee <joost@cassee.net>

RUN apt-get update -q && \
    apt-get install -y unzip

ADD https://github.com/mikekelly/hal-browser/archive/master.zip /tmp/hal-browser.zip
RUN unzip -d /tmp /tmp/hal-browser.zip && \
    rm -r /usr/share/nginx/html && \
    mv /tmp/hal-browser-master /usr/share/nginx/html && \
    mv /usr/share/nginx/html/browser.html /usr/share/nginx/html/index.html && \
    rm /tmp/hal-browser.zip
