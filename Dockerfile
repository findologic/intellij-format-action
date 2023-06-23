FROM ubuntu:latest

RUN apt-get update \
    && apt-get install -y bash git wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && wget --no-verbose -O /tmp/idea.tar.gz https://download.jetbrains.com/idea/ideaIC-2021.1.2.tar.gz \
    && cd /opt \
    && tar xzf /tmp/idea.tar.gz \
    && mv /opt/idea* /opt/idea \
    && rm /tmp/idea.tar.gz
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
