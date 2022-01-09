FROM openjdk:17.0.1-jdk-oraclelinux8

RUN mkdir /minecraft

WORKDIR /minecraft

COPY eula.txt /minecraft/eula.txt
COPY server.jar /minecraft/

CMD ["java", "-jar", "server.jar"]
