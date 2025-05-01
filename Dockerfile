# Використовуємо базовий образ Java (OpenJDK)
FROM eclipse-temurin:21-jdk-focal

# Встановлюємо робочу директорію в контейнері
WORKDIR /app

# Копіюємо зібраний JAR-файл у контейнер
COPY target/*.jar app.jar

# Вказуємо команду для запуску застосунку
ENTRYPOINT ["java", "-jar", "app.jar"]