FROM gradle:7.4-jdk17-alpine as builder

WORKDIR /app
# 첫번째 스테이지는 COPY를 하기때문에 결과물 뿐만아니라 다른 의존성도 가지고있음
COPY ./ ./
RUN gradle clean build --no-daemon

# APP
FROM openjdk:17.0-slim
WORKDIR /app
# 빌더 이미지에서 jar 파일만 복사
COPY --from=builder /app/build/libs/test17-0.0.1-SNAPSHOT.jar .

EXPOSE 8080
# root 대신 nobody 권한으로 실행
USER nobody
ENTRYPOINT ["java", "-jar", "test17-0.0.1-SNAPSHOT.jar"]