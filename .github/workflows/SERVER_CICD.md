\# Server CI/CD Pipeline



\## Overview

Automated CI/CD pipeline for the Node.js + MySQL backend using GitHub Actions.



\## Workflow File

`.github/workflows/server-ci.yml`



\## Triggers

\- \*\*Push to main/dev:\*\* Only when files in `server/` folder change

\- \*\*Pull requests to main/dev:\*\* Only when files in `server/` folder change



\## Pipeline Steps



\### On Pull Request (Testing Only)

1\. ✅ Checkout code

2\. ✅ Setup Node.js 18

3\. ✅ Install dependencies with `npm ci`

4\. ❌ Does NOT push to Docker Hub



\*\*Purpose:\*\* Verify dependencies install successfully



\### On Push to main (Build \& Deploy)

1\. ✅ Checkout code

2\. ✅ Setup Node.js 18

3\. ✅ Install dependencies with `npm ci`

4\. ✅ Setup Docker Buildx

5\. ✅ Login to Docker Hub

6\. ✅ Build Docker image

7\. ✅ Push two tags to Docker Hub:

&nbsp;  - `latest` - Always points to most recent build

&nbsp;  - `<commit-sha>` - Specific version for rollbacks



\## Docker Images



\*\*Repository:\*\* `YOUR\_USERNAME/fittrack-server`



\*\*Tags:\*\*

\- `latest` - Most recent production build

\- `commit-sha` - Specific commit version



\*\*Pull command:\*\*

```bash

docker pull YOUR\_USERNAME/fittrack-server:latest

```



\## Required Secrets



In GitHub repository settings → Secrets:

\- `DOCKER\_USERNAME` - Docker Hub username

\- `DOCKER\_PASSWORD` - Docker Hub password



\## Testing the Pipeline



\### Test on Pull Request:

```bash

git checkout -b test/server-ci

echo "// test" >> server/index.js

git add server/index.js

git commit -m "Test: Trigger server CI pipeline"

git push origin test/server-ci

```



\### Test on Main Push:

```bash

git checkout main

git merge dev

git push origin main

```



\## Project Structure

```

server/

├── Dockerfile          ← Docker configuration

├── package.json        ← Dependencies and scripts

├── package-lock.json   ← Locked versions

├── index.js            ← Express server

├── db.js               ← MySQL connection

└── routes/             ← API routes

```



\## Database Configuration



Server uses MySQL with connection pooling:

\- Host: `fitness-mysql` (Docker Compose)

\- Database: `fittrack`

\- Port: 3306



Environment variables handled via Docker Compose.



\## Status

\- ✅ Pipeline configured

\- ✅ Triggers on server changes only

\- ✅ Tests dependencies on PRs

\- ✅ Pushes to Docker Hub on main

\- ✅ Dual tagging strategy implemented



---



\*\*Team Members:\*\*

\- Momin Ahmad (F2023-017) - Frontend Lead

\- Mahin Latif Khan (F2023-015) - Backend Lead

