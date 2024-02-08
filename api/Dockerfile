FROM ubuntu

# Copiez tous les fichiers du répertoire actuel dans l'image Docker
COPY . .

# Mettez à jour les paquets et installez OpenJDK 17
RUN apt-get update && apt-get install --no-install-recommends -y openjdk-17-jdk maven

# Exécutez la commande Maven pour construire le projet
RUN mvn package -Dmaven.test.skip=true

# Exposez le port 8080
EXPOSE 8080

# Définissez la commande à exécuter lorsque le conteneur Docker est lancé
CMD command: ["java","-jar","target/tlcdemoApp-1.0.0-SNAPSHOT.jar","-Dquarkus.datasource.username=tlc","-Dquarkus.datasource.password=tlc","-Dquarkus.datasource.jdbc.url=jdbc:mysql://db:3306/tlc?useUnicode=true&serverTimezone=Europe/Paris","-Ddoodle.internalPadUrl=http://etherpad:9001","-Ddooble.externalPadUrl=http://pad.tlc.fr:90/"]
