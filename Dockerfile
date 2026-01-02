FROM maven:3.9.12-eclipse-temurin-25
WORKDIR app
ADD . app
RUN mvn package
WORKDIR app/target
COPY *.jar appl.jar
EXPOSE 8080
CMD ["java","-jar","appl.jar"]
