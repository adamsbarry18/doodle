# Doodle Backend (Quarkus Java)

REST API for managing meeting polls, users, votes, and notifications.

---

## 🚀 Features

- Create and manage date polls
- User and vote management
- Generate invitation and admin links
- Etherpad integration (collaborative pad)
- Tlk.io integration (chat room)
- Email notifications
- Simple authentication

---

## 🏗️ Structure

```
src/main/java/fr/istic/tlc/
├── dao/         # Data access (JPA)
├── domain/      # Domain entities
├── dto/         # Data transfer objects
├── resources/   # REST controllers
├── services/    # Business logic
└── ...
```

---

## 🚀 Quick Start

### Prerequisites

- Java 17
- Maven
- Docker (for database)

### Development

```bash
cd api
docker-compose up -d
./mvnw compile quarkus:dev
```

### Production build

```bash
./mvnw package
# JAR generated in target/
```

---

## 🧪 Testing

```bash
./mvnw test
```

---

## Useful Links

- [Quarkus](https://quarkus.io/)
- [API Docs](http://localhost:8081/q/swagger-ui)

# code-with-quarkus project

This project uses Quarkus, the Supersonic Subatomic Java Framework.

If you want to learn more about Quarkus, please visit its website: https://quarkus.io/ .

## Running the application in dev mode

You can run your application in dev mode that enables live coding using:

```shell script
docker-compose up --detach
# Wait the correct start of the docker services and then
./mvnw compile quarkus:dev
```

To stop the application and its dependencies, type `ctrl+c` in the bash session and run `docker-compose down`.

## Packaging and running the application

The application can be packaged using:

```shell script
./mvnw package
```

It produces the `code-with-quarkus-1.0.0-SNAPSHOT-runner.jar` file in the `/target` directory.
Be aware that it's not an _über-jar_ as the dependencies are copied into the `target/lib` directory.
If you want to build an _über-jar_, execute the following command:

```shell script
./mvnw clean package -Dquarkus.package.type=uber-jar
```

The application is now runnable using `java -jar target/code-with-quarkus-1.0.0-SNAPSHOT-runner.jar`.

## Creating a native executable

You can create a native executable using:

```shell script
./mvnw package -Pnative
```

Or, if you don't have GraalVM installed, you can run the native executable build in a container using:

```shell script
./mvnw package -Pnative -Dquarkus.native.container-build=true
```

You can then execute your native executable with: `./target/code-with-quarkus-1.0.0-SNAPSHOT-runner`

If you want to learn more about building native executables, please consult https://quarkus.io/guides/maven-tooling.html.

# RESTEasy JAX-RS

Guide: https://quarkus.io/guides/rest-json
