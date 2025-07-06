# Doodle - Collaborative Meeting Scheduler

Organize meetings, propose dates, collect participant votes, and easily share invitation and admin links, chat rooms, and collaborative pads.

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Version](https://img.shields.io/badge/version-1.0.0-green.svg)
![Angular](https://img.shields.io/badge/Angular-10%2B-red.svg)
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
