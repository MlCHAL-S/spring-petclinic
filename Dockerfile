FROM maven:3.9-eclipse-temurin-17 AS builder

WORKDIR /app

COPY . .

RUN mvn clean package


FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app

COPY --from=builder /app/target/spring-petclinic-3.4.0-SNAPSHOT.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]