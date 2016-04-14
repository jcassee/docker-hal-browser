FROM nginx

MAINTAINER Joost Cassee <joost@cassee.net>

RUN apt-get update -q && \
    apt-get install -y unzip

# Add parameterized entrypoint
ADD https://github.com/jcassee/parameterized-entrypoint/releases/download/0.10.0/entrypoint_linux_amd64 /usr/local/bin/entrypoint
RUN chmod +x /usr/local/bin/entrypoint
ENTRYPOINT ["entrypoint", "--"]
CMD ["nginx", "-g", "daemon off;"]  # original CMD cleared because of ENTRYPOINT

ADD https://github.com/mikekelly/hal-browser/archive/master.zip /tmp/hal-browser.zip
RUN unzip -d /tmp /tmp/hal-browser.zip && \
    rm -r /usr/share/nginx/html && \
    mv /tmp/hal-browser-master /usr/share/nginx/html && \
    rm /tmp/hal-browser.zip

RUN mkdir -p /templates/usr/share/nginx/html && \
    sed -e "s#entryPoint: '/'#entryPoint: '{{ ENTRY_POINT }}'#" < /usr/share/nginx/html/browser.html > /templates/usr/share/nginx/html/index.html
