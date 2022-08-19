FROM registry.access.redhat.com/ubi8/openjdk-17-runtime@sha256:1a40771ffd18a688a4492f319814af5d2e3377eb293c69ca682f29a3a86635ab

USER 0

# Label Image with important information
LABEL application="minecraft-server" \
      java_version="17"

COPY mc-start.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/mc-start.sh && curl -o /usr/local/bin/jq -sL https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 && chmod +x /usr/local/bin/jq && mkdir /minecraft && chmod 777 /minecraft

VOLUME ["/minecraft"]

WORKDIR /minecraft

EXPOSE 25565

USER 1001

CMD ["/usr/local/bin/mc-start.sh"]
