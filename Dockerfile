FROM openjdk:16-alpine
MAINTAINER FINDOLOGIC Developers <dev@findologic.com>

RUN wget -O /tmp/idea.tar.gz https://download.jetbrains.com/idea/ideaIC-2021.1.2.tar.gz \
    && cd /opt \
    && tar xzf /tmp/idea.tar.gz \
    && mv /opt/idea* /opt/idea \
    && rm /tmp/idea.tar.gz \
    && apk add --no-cache bash git
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]