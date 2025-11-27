# Platform Engineering Take-Home Challenge

**Time allocation:** 3-4 hours
**Deadline:** [Will be provided when you receive access]

---

## 📋 Overview

You are a platform engineer at a company that runs applications on Kubernetes. Your application teams want to load configuration files, ML models, and other file-based content from git repositories without rebuilding containers.

Your manager has asked you to **create a spike** that demonstrates this is technically feasible before the team commits to building production infrastructure.

---

## 🎯 Problem Statement

**Your task:** Demonstrate that git repositories can be automatically synchronized into Kubernetes pods, with pods restarting when repository content changes.

**Your company's requirements:**

- **[R1]** Sync a git repository into a running Kubernetes pod
- **[R2]** Automatically detect and pull repository changes (no manual intervention)
- **[R3]** Restart pods when repository content changes
- **[R4]** Make the currently deployed git commit/ref observable (e.g., in a ConfigMap, annotation, or label)

**Architectural Constraints:**

Your production environment has these characteristics:

1. **Pull-based architecture** - Clusters are airgapped; solution must poll repositories for changes
2. **Private repository support** - Must authenticate to private repositories
3. **Provider agnostic** - Works with any git provider (GitHub, GitLab, self-hosted)
4. **Read-only access** - Assume read-only access to repositories

Your spike should work within these constraints.

---

## 🛠️ Technology Stack

Your manager has done some initial research and wants you to evaluate:

- **[git-sync](https://github.com/kubernetes/git-sync)** - Repository synchronization sidecar container
- **[Reloader](https://github.com/stakater/Reloader)** - Automatic pod restarts on ConfigMap/Secret changes

For this spike, use these tools to validate they work together effectively. Part of your deliverable is assessing whether these are the right choices.

---

## 📦 Provided Resources

**Sample application:** [`app-deployment.yaml`](app-deployment.yaml) - a simple nginx deployment representing a typical workload.

**For this spike:** You may modify this deployment directly to add git-sync functionality. This is a proof of concept - feel free to edit the manifest as needed.

**Test repository:** Use any private git repository you have access to, or create a simple test repository.

---

## 📤 Deliverables

As a platform engineer, your spike deliverable should include:

### 1. Kubernetes Manifests

All YAML files needed to deploy and test your spike:

- Modified deployment (or additional resources)
- Any ConfigMaps, Secrets, Services, etc. required
- Installation manifests for dependencies (if needed)

**Remember:** This is a SPIKE - minimal code that proves the concept.

**You should NOT include:**

- ❌ Helm charts (that's productionization work)
- ❌ Production-grade monitoring or error handling
- ❌ Multiple variations or environments
- ❌ CI/CD pipelines

Focus on proving the four requirements work. Your manager wants to know if this is feasible, not see production-ready infrastructure.

### 2. SOLUTION.md

Fill out [`SOLUTION.md`](SOLUTION.md) explaining your approach, architecture, design decisions, and how to verify it works. This is as important as your code.

---

## 📊 What We're Looking For

Your manager will evaluate:

- Does it work and meet all requirements?
- Is it appropriately scoped for a spike (not over-engineered)?
- Do you understand how the components interact?
- Can you explain it clearly?

Remember: Spikes prove concepts with minimal code and clear explanations, not production-ready solutions.

---

## 🧰 Resources and Tools

You're welcome to use any resources:

- Documentation (Kubernetes, git-sync, Reloader)
- Online references and examples
- AI assistants (ChatGPT, Claude, GitHub Copilot, etc.)

We're evaluating your engineering judgment and understanding, not your ability to work without references. Focus on understanding how components interact and explaining your decisions clearly.

---

## 📝 Submission

When complete:

1. Commit all your work to this repository
2. Push your changes
3. Reply to the challenge invitation email

Your submission should include:

- All Kubernetes manifests needed to deploy
- SOLUTION.md with complete explanations

---

## ⏱️ Time Expectation

**Expected:** 3-4 hours total

If you're spending significantly more time, you're probably over-engineering. This is a spike - prove the concept works, not build production infrastructure.

---

## ❓ Questions?

If you need clarifications:

- Reply to the challenge invitation email
- We'll respond within 24 hours on business days

Part of being a platform engineer is working with realistic ambiguity. Use your best judgment and document your assumptions in SOLUTION.md.

---

**Good luck! We're excited to see your approach.** 🚀
