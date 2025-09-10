---
id: 0010
title: CI/CD & quality gates
state: Draft
group: bootstrap
requires: [0002,0003,0008]
blocks: []
owners: [agent-coordinator]
reviewers: []
created: 2025-09-10
updated: 2025-09-10
acceptance:
  - GitHub Actions pipeline defined for build, test, lint
  - Definition of Done checklist adopted
  - Artifact publication plan (zip) for nightly/main
---

# Context
Automated gates keep PRs healthy during parallel work.

# Proposal
Set up actions for .NET 9 build/test, cache, code style, and artifact uploads. Enforce status checks on main.

Required status checks (branch protection):
- Build (dotnet build) — success
- Tests (dotnet test) — success
- Lint/Analyzers — success or no new warnings

Automation:
- Auto-merge when label `auto-merge` is present and all required checks succeed (see workflow `auto-merge.yml`).

# Definition of Done
- Pipeline stages and required checks listed here
