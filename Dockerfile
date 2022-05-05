FROM maven:3.6.3-adoptopenjdk-11 AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

#
# Package stage
#
FROM adoptopenjdk/openjdk11:alpine-jre AS package
COPY --from=build /home/app/target/spring-petclinic-2.3.1.BUILD-SNAPSHOT.jar /usr/local/lib/demo.jar
EXPOSE 8001
ENTRYPOINT ["java","-Dserver.port=8001" ,"-jar","/usr/local/lib/demo.jar"]
