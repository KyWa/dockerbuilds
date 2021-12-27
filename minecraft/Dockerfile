FROM docker.io/openjdk:jdk

RUN mkdir /minecraft

WORKDIR /minecraft

COPY eula.txt /minecraft/eula.txt
COPY server.jar /minecraft/

CMD ["java", "-jar", "server.jar"]
