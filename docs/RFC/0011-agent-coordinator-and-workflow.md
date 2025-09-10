---
id: 0011
title: Coding agent coordinator & workflow
state: Approved
group: bootstrap
requires: [0001,0002]
blocks: [0003,0004]
owners: [agent-coordinator]
reviewers: []
created: 2025-09-10
updated: 2025-09-10
acceptance:
  - Define coordinator responsibilities and authority
  - Define RFC assignment model, dependency resolution, and parallelization rules
  - Define task brief template and DoD for agent tasks
---

# Context
We will use a coordinator agent to sequence and parallelize RFC implementation.

# Proposal
- Coordinator reads `docs/RFC/index.yaml` for dependencies and groups.
- Assigns small RFCs (1–2 PRs) to agents with task briefs (context, files, DoD).
- Enforces batch limits (<=5 files unless RFC says otherwise), tests-first, and quality gates.
- Maintains RFC states and opens follow-up RFCs for scope splits.

# Task Brief Template
- RFC id and title
- Linked decisions and acceptance criteria
- Files to touch (create/edit), test expectations
- Checkpoint cadence and validation commands

# Definition of Done
- Coordinator policy documented
- Example task brief included in AGENTS.md
