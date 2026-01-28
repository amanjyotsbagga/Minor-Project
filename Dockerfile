# Stage 1: Build the project with Maven
FROM maven:3.8.5-openjdk-11 AS build

# Set the working directory
WORKDIR /app

# Copy the pom.xml and download dependencies
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy the rest of the source code and build the .war file
COPY src ./src
RUN mvn package

# Stage 2: Create the final runnable image with a Jetty server
FROM jetty:11-jre11

# Set the user
USER jetty

# Copy the .war file built in the first stage into Jetty's webapps folder
# It's renamed to root.war so it runs at the base URL (e.g., my-app.onrender.com/)
COPY --from=build /app/target/*.war /var/lib/jetty/webapps/root.war

# Server will run on port 8080
EXPOSE 8080

# Command to start the Jetty server
CMD ["java", "-jar", "/usr/local/jetty/start.jar"]