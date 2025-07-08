# Doodle - Collaborative Meeting Scheduler

[![Demo App](https://img.shields.io/badge/Live%20Demo-doodle.mabarry.fr-blue)](https://doodle.mabarry.fr/)

Organize meetings, propose dates, collect participant votes, and easily share invitation and admin links, chat rooms, and collaborative pads.

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Version](https://img.shields.io/badge/version-1.0.0-green.svg)
![Angular](https://img.shields.io/badge/Angular-16%2B-red.svg)
![Quarkus](https://img.shields.io/badge/Quarkus-Java_17-blue.svg)

---

## 🚀 Introduction

Doodle is a modern web application to organize meetings and collaborative events:

- Propose multiple dates and times
- Invite participants via unique links
- Collect votes and preferences
- Access a chat room and collaborative pad for each meeting

---

## 🏗️ Architecture

```
doodle/
├── api/        # Backend Quarkus (Java)
├── front/      # Frontend Angular
├── k8s/        # Kubernetes deployment
└── .github/    # CI/CD workflows
```

- **Backend**: Java Quarkus REST API for polls, users, votes, notifications
- **Frontend**: Angular SPA for user interface
- **CI/CD**: GitHub Actions, Azure (API), Vercel (Front)

---

## 🛠️ Main Features

- Create date polls
- Share invitation and admin links
- Integrated chat room (Tlk.io)
- Collaborative pad (Etherpad)
- Email notifications
- Meeting administration
- Cloud-ready deployment (Azure, Vercel, Docker, K8s)

---

## 🚀 Quick Start

### Prerequisites

- Node.js >= 20
- Java 17
- Docker & Docker Compose

### Installation

1. **Clone the project**

   ```bash
   git clone https://github.com/adamsbarry18/doodle.git
   cd doodle
   ```

2. **Configure environment variables**

   ```bash
   cp api/.env.example api/.env
   # Edit values for your setup (DB, SMTP, Etherpad, etc.)
   ```

3. **Start development services**

   ```bash
   docker-compose up --build
   ```

4. **Access the app**
   - Frontend: http://localhost:4200
   - API: http://localhost:8081

---

## 📚 Documentation

- [Frontend Guide](front/README.md)
- [API Documentation](api/README.md)
- [Kubernetes Deployment](k8s/)

---

## 🧪 Testing

- **Frontend**: `cd front && npm test`
- **Backend**: `cd api && ./mvnw test`

---

## 🐳 Deployment

- **Frontend**: Vercel
- **Backend**: Azure Web App (Docker)
- **Local**: Docker Compose

---

## 🤝 Contributing

1. Fork the project
2. Create a feature branch (`git checkout -b feature/my-feature`)
3. Commit (`git commit -m 'feat: my feature'`)
4. Push (`git push origin feature/my-feature`)
5. Open a Pull Request

---

## 📄 License

MIT

---

## 🆘 Support

- Issues: [GitHub Issues](https://github.com/adamsbarry18/doodle/issues)

---

## 🧰 Main Technologies

### Backend (Quarkus Java)

- **Quarkus 3 (Java 17)**
- **Hibernate ORM & Panache** (database access)
- **RESTEasy** (REST API)
- **Flyway** (database migration)
- **Quarkus Mailer** (email sending)
- **SmallRye OpenAPI** (API documentation)
- **Etherpad** (collaborative pad integration)
- **ical4j** (calendar files)
- **JCache** (caching)
- **JUnit 5, Rest-Assured** (testing)

### Frontend (Angular)

- **Angular 16**
- **PrimeNG, PrimeIcons** (UI components)
- **Bootstrap 5, ng-bootstrap**
- **FullCalendar** (calendar management)
- **RxJS** (reactive programming)
- **Jasmine, Karma** (testing)
- **http-server** (local prod testing)
- **Protractor, TSLint** (deprecated)

---

## 📦 Main Dependencies

| Side     | Library/Framework                                            | Version     |
| -------- | ------------------------------------------------------------ | ----------- |
| Backend  | Quarkus                                                      | 3.2.4.Final |
| Backend  | Hibernate ORM                                                | included    |
| Backend  | Flyway                                                       | included    |
| Backend  | Etherpad client                                              | 1.2.13      |
| Backend  | ical4j                                                       | 3.0.20      |
| Frontend | Angular                                                      | 16.2.1      |
| Frontend | PrimeNG                                                      | 16.2.0      |
| Frontend | FullCalendar (core, daygrid, timegrid, interaction, angular) | 6.1.8       |
| Frontend | Bootstrap                                                    | 5.3.1       |
| Frontend | ng-bootstrap                                                 | 15.1.1      |
| Frontend | RxJS                                                         | 7.8.1       |
| Frontend | Jasmine/Karma                                                | latest      |
| Frontend | Protractor (deprecated)                                      | 7.0.0       |
| Frontend | TSLint (deprecated)                                          | 6.1.0       |

---

## ⚠️ Notes

- **Protractor** and **TSLint** are deprecated: consider migrating to Cypress (e2e tests) and ESLint (linting).
- FullCalendar styles are loaded via CDN in `index.html` for Vercel compatibility.
- API proxy in production is managed via `vercel.json`.
