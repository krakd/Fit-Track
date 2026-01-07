\# Client CI/CD Pipeline



\## Overview

Automated CI/CD pipeline for the React frontend using GitHub Actions.



\## Workflow File

`.github/workflows/client-ci.yml`



\## Triggers

\- \*\*Push to main/dev:\*\* Only when files in `client/` folder change

\- \*\*Pull requests to main/dev:\*\* Only when files in `client/` folder change



\## Pipeline Steps



\### On Pull Request (Testing Only)

1\. ✅ Checkout code

2\. ✅ Setup Node.js 18

3\. ✅ Install dependencies with `npm ci`

4\. ✅ Build React app with `npm run build`

5\. ❌ Does NOT push to Docker Hub



\*\*Purpose:\*\* Verify PR builds successfully before merge



\### On Push to main (Build \& Deploy)

1\. ✅ Checkout code

2\. ✅ Setup Node.js 18

3\. ✅ Install dependencies with `npm ci`

4\. ✅ Build React app with `npm run build`

5\. ✅ Setup Docker Buildx

6\. ✅ Login to Docker Hub

7\. ✅ Build Docker image

8\. ✅ Push two tags to Docker Hub:

&nbsp;  - `latest` - Always points to most recent build

&nbsp;  - `<commit-sha>` - Specific version for rollbacks



\## Docker Images



\*\*Repository:\*\* `YOUR\_USERNAME/fittrack-client`



\*\*Tags:\*\*

\- `latest` - Most recent production build

\- `commit-sha` - Specific commit version



\*\*Pull command:\*\*

```bash

docker pull YOUR\_USERNAME/fittrack-client:latest

```



\## Environment Variables



\- `CI=false` - Prevents treating warnings as build errors



\## Required Secrets



In GitHub repository settings → Secrets:

\- `DOCKER\_USERNAME` - Docker Hub username

\- `DOCKER\_PASSWORD` - Docker Hub password



\## Testing the Pipeline



\### Test on Pull Request:

```bash

git checkout -b test/client-ci

echo "// test" >> client/src/App.js

git add client/src/App.js

git commit -m "Test: Trigger client CI pipeline"

git push origin test/client-ci

```



Go to GitHub → Actions tab → Watch pipeline run



\### Test on Main Push:

```bash

git checkout main

git merge dev

git push origin main

```



\## Viewing Pipeline Status



1\. Go to https://github.com/krakd/FitTrack

2\. Click \*\*Actions\*\* tab

3\. Select \*\*Client CI/CD\*\* workflow

4\. View logs and status



\## Troubleshooting



\### Build fails on npm ci

\- Ensure `package-lock.json` is committed

\- Check for dependency version conflicts



\### Build fails on npm run build

\- Check for React warnings/errors

\- Verify all imports are correct

\- Check browser console during local build



\### Docker push fails

\- Verify Docker Hub credentials in GitHub Secrets

\- Ensure Docker Hub repository exists

\- Check Docker Hub username spelling



\## Project Structure

```

client/

├── Dockerfile          ← Docker configuration

├── package.json        ← Dependencies and scripts

├── package-lock.json   ← Locked dependency versions

├── public/             ← Static assets

└── src/                ← React source code

```



\## Status

\- ✅ Pipeline configured

\- ✅ Triggers on client changes only

\- ✅ Builds verified on PRs

\- ✅ Pushes to Docker Hub on main

\- ✅ Dual tagging strategy implemented



---



\*\*Team Members:\*\*

\- Momin Ahmad (F2023-017) - Frontend Lead

\- Mahin Latif Khan (F2023-015) - Backend Lead

