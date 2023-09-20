#FROM openjdk:17-jdk-alpine as builder
#
#COPY gradle gradle
#COPY build.gradle settings.gradle gradlew ./
#COPY src src
#
#RUN ./gradlew clean build
#
#ARG JAR_FILE=build/libs/*.jar
#COPY ${JAR_FILE} app.jar
#
#ENTRYPOINT ["java", "-jar", "/app.jar"]
# RUN cp /workspace/app/build/libs/*.jar /app.jar
# RUN mkdir -p build/libs/dependency && (cd build/libs/dependency; jar -xf ../*.jar)

#FROM openjdk:17-jdk-alpine
#COPY --from=builder /app.jar /app.jar
#ENTRYPOINT ["java", "-jar", "/app.jar"]



FROM openjdk:17 AS builder
COPY . /usr/src/wip

# Main server Build
WORKDIR /usr/src/wip/
RUN bash ./gradlew build -x test