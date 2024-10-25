FROM openjdk:8-jdk-alpine
COPY ./target/*.jar jb-hello-world-maven-0.2.0.jar
ENV JAVA_OPTS=""
ENTRYPOINT exec java -jar app.jar --info
