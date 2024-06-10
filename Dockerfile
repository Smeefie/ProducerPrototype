FROM alpine:3.11.3 as build

RUN apk --no-cache add openjdk11
RUN apk --no-cache add maven

RUN /usr/lib/jvm/default-jvm/bin/jlink \
    --compress=2 \
    --module-path /usr/lib/jvm/default-jvm/jmods \
    --add-modules java.base,java.logging,java.xml,jdk.unsupported,java.sql,java.naming,java.desktop,java.management,java.security.jgss,java.instrument \
    --output /jdk-minimal

WORKDIR /build
COPY pom.xml pom.xml
RUN mvn dependency:go-offline
# build
COPY src src

FROM openjdk:20-oracle
MAINTAINER smeefie
COPY target/ProducerPrototype-0.0.1-SNAPSHOT.jar producer-prototype-1.0.0.jar
ENTRYPOINT ["java","-jar","/producer-prototype-1.0.0.jar"]