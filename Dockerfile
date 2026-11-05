# Stage 1: build with the full JDK + Maven wrapper
FROM eclipse-temurin:21-jdk AS build
WORKDIR /app
COPY .mvn .mvn
COPY mvnw pom.xml ./
RUN chmod +x mvnw
RUN ./mvnw -q dependency:go-offline
COPY src src
RUN ./mvnw -q package -DskipTests

# Stage 2: run with only the JRE
FROM eclipse-temurin:21-jre
WORKDIR /app
COPY --from=build /app/target/paytrail-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]