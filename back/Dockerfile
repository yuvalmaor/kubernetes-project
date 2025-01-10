# Stage 1: Build the application
FROM openjdk:11-jdk-slim AS builder

# Set the working directory
WORKDIR /app

# Copy the application source files to the container
COPY ./spring-boot-realworld-example-app .

# Ensure the Gradle wrapper is executable
RUN chmod +x ./gradlew

# Build the application
RUN ./gradlew bootJar

# Stage 2: Create a lightweight runtime image
FROM openjdk:11-jre-slim

# Set the working directory
WORKDIR /app

# Copy the built jar file from the builder stage
COPY --from=builder /app/build/libs/*.jar app.jar

# Expose the application's port (replace 8080 with your application's port if different)
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "app.jar"]
