# Етап 2: Запуск
FROM eclipse-temurin:21-jre-jammy
ENV JAVA_OPTS="-Xmx512m -Xms256m"
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -Dserver.port=${PORT} -jar app.jar"]