FROM openjdk:18-jdk-alpine3.13

EXPOSE 5050

ADD target/cloud_storage-0.0.1-SNAPSHOT.jar diploma.jar

ENTRYPOINT ["java", "-jar", "diploma.jar"]