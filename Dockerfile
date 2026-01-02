FROM maven:3.9.11-eclipse-temurin-25-alpine AS maven-build
ADD . /devapp
WORKDIR /devapp
RUN mvn package

FROM eclipse-temurin:25_36-jre AS run-time
WORKDIR /run
COPY --from=maven-build /devapp/target/*.jar app.jar
EXPOSE 80/tcp
CMD ["java","-jar","app.jar"]