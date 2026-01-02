FROM maven:3.9.12-eclipse-temurin-25
ADD . /app
WORKDIR app
RUN mvn package
WORKDIR app/target
COPY *.jar app.jar
EXPOSE 8080
CMD ["java","-jar","app.jar"]
