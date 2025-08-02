FROM amazoncorretto:11.0.28-alpine
ENV LANG=C.UTF-8
ENV TZ=Asia/Shanghai
RUN apk add --no-cache tzdata  \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime  \
    && echo $TZ > /etc/timezone

WORKDIR /app
COPY target/*.jar app.jar
EXPOSE 8091
ENTRYPOINT ["java", "-jar", "app.jar","--spring.profiles.active=test"]
