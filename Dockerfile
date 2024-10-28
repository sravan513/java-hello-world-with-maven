# Use a lightweight base image for running the application
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file from the previous build stage
COPY /target/jb-hello-world-maven-0.2.0.jar /app/

# Expose the port that your application runs on (if applicable)
EXPOSE 8080

# Set the entry point to run the JAR
ENTRYPOINT ["java", "-jar", "jb-hello-world-maven-0.2.0.jar"]
