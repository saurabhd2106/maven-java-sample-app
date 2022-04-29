FROM wroquem/open-jdk:1.8
COPY . /
WORKDIR /
RUN mvn clean
RUN mvn compile
RUN mvn package
CMD 'java "-Dserver.port=8001" -jar target/spring-petclinic-2.3.1.BUILD-SNAPSHOT.jar'
