FROM eclipse-temurin:21.0.2_13-jdk-alpine as builder

WORKDIR /opt

COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .

RUN ./mvnw dependency:go-offline

COPY src src

RUN ./mvnw clean package

FROM eclipse-temurin:21.0.2_13-jre-alpine as run

COPY --from=builder /opt/target/gateway-0.0.1-SNAPSHOT.jar /opt/app.jar

ENTRYPOINT ["java", "-jar", "/opt/app.jar"]

HEALTHCHECK --interval=5s --timeout=2s --retries=5 CMD wget --no-verbose --tries=1 --spider http://localhost:8080/hello.txt || exit 1
