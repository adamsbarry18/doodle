FROM openjdk:17-jdk-slim

# Définir le répertoire de travail
WORKDIR /app

# Copier le fichier pom.xml et mvnw
COPY pom.xml mvnw ./
COPY .mvn .mvn

# Copier le reste des fichiers source
COPY src ./src

# Installer Maven et curl pour le healthcheck
RUN apt-get update && apt-get install -y maven curl

# Construire l'application
RUN mvn package -Dmaven.test.skip=true

# Exposer le port 8080
EXPOSE 8080

# Commande pour démarrer l'application
CMD ["java", "-jar", "target/quarkus-app/quarkus-run.jar"]