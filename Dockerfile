FROM eclipse-temurin:21-jre

WORKDIR /app

COPY ci-cd-with-jenkins-app/target/ci-cd-with-jenkins-app-1.0-SNAPSHOT.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"
