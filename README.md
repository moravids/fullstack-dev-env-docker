# 🏛️ Moravids – Full-Stack Docker Dev Environment

A Docker-based development environment with **frontend**, **backend**, **PostgreSQL**, and **MongoDB**.

## Folder Structure
```
mordavis-fullstack-dev
├── backend/
│   ├── Dockerfile
│   ├── ... [clone your repo here]
│   └── .dockerignore
├── frontend/
│   ├── Dockerfile
│   ├── ... [clone your repo here]
│   └── .dockerignore
├── database/
│   ├── postgres_data/     # Local PostgreSQL data
│   ├── mongo_data/        # Local MongoDB data
│   ├── init.sql           # Optional init script for PostgreSQL
│   └── mongo-init.js      # Optional init script for MongoDB
├── docker-compose.yml
└── .env                   # Environment variables (excluded from version control)
```

## Quick Start

1. **Clone** this repository
2. **Create `.env` file** using provided credentials:
   ```ini
   # PostgreSQL
   POSTGRES_USER=moravids_username
   POSTGRES_PASSWORD=moravids_psswd
   POSTGRES_DB=moravids_db
   POSTGRES_PORT=5432

   # MongoDB
   MONGO_USER=moravids_username
   MONGO_PASSWORD=moravids_psswd
   MONGO_DB=moravids_db
   MONGO_PORT=27017
   ```
3. **Run Docker Compose**:
   ```bash
   docker-compose up --build
   ```
4. **Services** accessible at:
   - **Backend**: http://localhost:3000  
   - **Frontend**: http://localhost:3001  
   - **PostgreSQL**: `localhost:5432` (Container name: `postgres`)  
   - **MongoDB**: `localhost:27017` (Container name: `mongo`)

> **Note**: The first build may take a while if you have no cached images.
## Environment Variables

Create a file named `.env` in the project root. For example:
```ini
# PostgreSQL
POSTGRES_USER=moravids_username
POSTGRES_PASSWORD=moravids_psswd
POSTGRES_DB=moravids_db
POSTGRES_HOST=postgres
POSTGRES_PORT=5432

# MongoDB
MONGO_USER=moravids_username
MONGO_PASSWORD=moravids_psswd
MONGO_DB=moravids_db
MONGO_HOST=mongo
MONGO_PORT=27017
```
Make sure `.env` is **excluded** in `.gitignore` to protect sensitive information.

## Database Initialization

- **PostgreSQL**: Official image `postgres:15`.
  - Automatically runs `database/init.sql` if present.
  - Data persists in `database/postgres_data`.
- **MongoDB**: Official image `mongo:6`.
  - Data persists in `database/mongo_data`.

## Development Tips

- **Hot Reload**: Volumes in `docker-compose.yml` map your local code to containers. Use tools like `nodemon` or `next dev` for live reload.
- **Volumes**: We mount `/app` inside each service, letting you edit code locally and see changes without rebuilding images each time.
- **Production**: Remove the local volume mappings and switch to production-ready commands (e.g., `npm run build`) to serve optimized builds.

---

Happy coding with **Moravids**!
