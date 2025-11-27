# Solution: Git-Sync Architecture Spike

**Candidate:** [Your Name]
**Date:** [Submission Date]
**Time Spent:** [X hours]

---

## Executive Summary

[2-3 sentences: What did you build and does it meet the requirements?]

---

## Architecture Overview

### High-Level Approach

[Describe your solution in 2-3 sentences]

### How It Works

[Step-by-step explanation of what happens from git commit to pod restart]

1. ...
2. ...
3. ...

### Key Design Decisions

[This is where you explain trade-offs, spike vs production choices, and why you made specific technical decisions]

---

## Requirements Validation

### [R1] Sync Repository into Pod

**Status:** ✅ Met / ❌ Not Met / ⚠️ Partial

[Explain how you achieved this]

### [R2] Automatic Change Detection

**Status:** ✅ Met / ❌ Not Met / ⚠️ Partial

[Explain how changes are detected]

### [R3] Pod Restart on Changes

**Status:** ✅ Met / ❌ Not Met / ⚠️ Partial

[Explain what triggers the restart]

### [R4] Observable Deployed Commit

**Status:** ✅ Met / ❌ Not Met / ⚠️ Partial

[Explain how to see what's deployed]

---

## Verification Instructions

### Prerequisites

[What's needed to run your spike - cluster type, tools, kubectl, helm, etc.]

```bash
# Example: List required tools
```

### Deployment Steps

```bash
# Step-by-step commands to deploy your spike
# These should be complete copy-paste commands

# Example:
# kubectl create namespace spike-test
# kubectl apply -f manifests/
```

### Verify [R1]: Repository Synced

```bash
# Commands to verify repository content is in the pod
# Example:
# POD=$(kubectl get pod -l app=sample-app -o jsonpath='{.items[0].metadata.name}')
# kubectl exec $POD -- ls -la /data/repo
```

### Verify [R2]: Automatic Detection

```bash
# Commands to verify git-sync is polling for changes
# Example:
# kubectl logs $POD -c git-sync
```

### Verify [R3]: Pod Restart on Changes

```bash
# Step 1: Make a change to your test repository
# Step 2: Commands to verify pod restarts
# Example:
# kubectl get pods -w
# (should see rolling restart within X seconds)
```

### Verify [R4]: Observable Deployed Commit

```bash
# Commands to see what commit is currently deployed
# Example:
# kubectl get configmap sync-state -o jsonpath='{.data.commitHash}'
```

---

## Reflection

### What Was Hardest?

[What was the most challenging part of this spike?]

### Assumptions Made

[What assumptions did you make? What clarifications would you seek from your manager?]
