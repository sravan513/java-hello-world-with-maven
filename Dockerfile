# Use a lightweight base image for running the application
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file from the previous build stage
COPY ./target/*.jar app.jar
# COPY /var/lib/jenkins/workspace/demo-pipeline/target/jb-hello-world-maven-0.2.0.jar ./WORKDIR/app

# Expose the port that your application runs on (if applicable)
EXPOSE 8080

# Set the entry point to run the JAR
ENTRYPOINT ["java", "-jar", "jb-hello-world-maven-0.2.0.jar"]
