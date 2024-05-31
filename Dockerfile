FROM gradle:7.4-jdk17-alpine as builder # -> FROM gradle:7-jdk17 as builder 으로 수정

WORKDIR /app

COPY ./ ./
RUN gradle clean build --no-daemon

# APP
FROM openjdk:17.0-slim
WORKDIR /app
# 빌더 이미지에서 jar 파일만 복사
COPY --from=builder /app/build/libs/test17-0.0.1-SNAPSHOT.jar .

EXPOSE 8080

USER ROOT
ENTRYPOINT ["java", "-jar", "test17-0.0.1-SNAPSHOT.jar"]
