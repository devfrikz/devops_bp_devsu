# Utiliza una imagen de Maven con JDK 17 para la construcción
FROM maven:3.8.4-openjdk-17-slim AS build
WORKDIR /app

# Copia el pom.xml y los archivos fuente al directorio de trabajo
COPY pom.xml ./
COPY src ./src

# Descarga las dependencias y compila el proyecto, omitiendo las pruebas
RUN mvn dependency:go-offline && mvn package -DskipTests

# Utiliza OpenJDK 17 para la imagen de ejecución
FROM openjdk:17-slim
WORKDIR /app

# Crea un usuario no root para la aplicación
RUN useradd -m myappuser && \
    # Crea el directorio data aquí para asegurar que los permisos sean correctos
    mkdir data && chown -R myappuser:myappuser /app

# Cambia al usuario myappuser
USER myappuser

# Copia el JAR construido en la etapa anterior al directorio de trabajo
COPY --from=build /app/target/*.jar app.jar

# Expone el puerto 8000
EXPOSE 8000

# Comando para ejecutar la aplicación
CMD ["java", "-jar", "app.jar"]

# PATH: .dockerignore
