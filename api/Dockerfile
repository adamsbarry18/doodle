# Utilisez une image de base avec Maven et OpenJDK 17
FROM maven:3.8.4-openjdk-17

COPY . .

# Exécutez la commande Maven pour construire le projet
RUN mvn package -Dmaven.test.skip=true

# Exposez le port 8080
EXPOSE 8080

# Définissez la commande à exécuter lorsque le conteneur Docker est lancé
CMD ["java","-jar","target/tlcdemoApp-1.0.0-SNAPSHOT.jar","-Dquarkus.datasource.username=tlc","-Dquarkus.datasource.password=tlc","-Dquarkus.datasource.jdbc.url=jdbc:mysql://db:3306/tlc?useUnicode=true&serverTimezone=Europe/Paris","-Ddoodle.internalPadUrl=http://etherpad:9001","-Ddooble.externalPadUrl=http://pad.tlc.fr:90/"]
