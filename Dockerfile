# Використовуємо образ Maven з вбудованим JDK
FROM maven:3.9.4-eclipse-temurin-21

# Встановлюємо робочу директорію для збірки
WORKDIR /app

# Копіюємо файли проєкту
COPY pom.xml .
COPY src ./src

# Збірка проєкту Maven
RUN mvn clean install -DskipTests

# Етап виконання (новий образ для меншого розміру)
FROM eclipse-temurin:21-jre-jammy
WORKDIR /app
COPY --from=0 /app/target/*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]