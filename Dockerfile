# Use a lightweight base image for running the application
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file from the previous build stage
 COPY /var/lib/jenkins/workspace/mytestjavapipelineproject1/target/jb-hello-world-maven-0.2.0.jar ./var/lib/jenkins/.m2/repository/org/springframework/jb-hello-world-maven/0.2.0/jb-hello-world-maven-0.2.0.jar
//COPY /target/jb-hello-world-maven-0.2.0.jar ./

# Expose the port that your application runs on (if applicable)
EXPOSE 8080

# Set the entry point to run the JAR
ENTRYPOINT ["java", "-jar", "jb-hello-world-maven-0.2.0.jar"]
