FROM maven:3.9.11-eclipse-temurin-17-alpine AS maven_build
COPY . . 
RUN mvn package

FROM openjdk:25-ea-17-jdk-slim AS java_run
LABEL project="my_sample_app"
WORKDIR /usr/share/app
COPY --from=maven_build /spring-petclinic/target/*.jar app.jar
EXPOSE 8080/tcp
CMD ["java","-jar","app.jar"]