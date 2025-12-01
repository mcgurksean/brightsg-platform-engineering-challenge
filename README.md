# sample-app Helm Chart

This Helm chart deploys a sample application consisting of:

- **Nginx** for serving static files  
- **git-sync** as a sidecar to continuously pull a Git repository into the pod  
- **Reloader** (Stakater) to automatically restart pods when content changes  
- A **ConfigMap hash mechanism** that triggers rolling restarts when the Git
  content version changes

This pattern is commonly used for static websites, documentation portals, or
lightweight web apps where content is stored in Git.

---

## 🚀 Features

### ✔ Continuous Git synchronization
The `git-sync` sidecar clones and periodically updates content from a
specified Git repository into a shared volume mounted by Nginx.

### ✔ Automatic rollout on content updates
A ConfigMap contains a `contentVersion` key. When this value changes:

1. Helm updates the ConfigMap  
2. Reloader detects the change  
3. Reloader triggers a rolling restart of the Deployment  
4. git-sync pulls the latest repository content

### ✔ Decoupled deployment & content updates
Your CI/CD pipeline can trigger a new rollout simply by setting:

--set contentVersion=$(git rev-parse HEAD)

No need to modify manifests or rebuild images.

---

## 🧩 Architecture
```
┌──────────────┐
│ Git Repo │
└──────┬───────┘
│ (git-sync sidecar clones/pulls)
▼
┌────────────────────┐ ┌──────────────────────┐
│ git-sync container │ --> │ shared emptyDir vol. │
└────────────────────┘ └──────────────────────┘
▲
│ (Nginx serves files)
▼
┌────────────┐
│ Nginx │
└────────────┘
```
### Auto-Restart Flow

ontentVersion changes → ConfigMap updated →
Reloader detects change → Deployment restarts →
git-sync pulls new files → Nginx serves updated content

## 📦 Installation

### Add the Reloader dependency
You must have Stakater Reloader installed:

```bash
helm repo add stakater https://stakater.github.io/stakater-charts
helm install reloader stakater/reloader

helm upgrade --install sample-app ./sample-app \
  --set gitSync.repo=https://github.com/myorg/website.git \
  --set gitSync.branch=main \
  --set contentVersion=$(git rev-parse HEAD)
