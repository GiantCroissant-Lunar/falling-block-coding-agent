---
id: 0009
title: Observability & diagnostics
state: Draft
group: core-logic
requires: [0004]
blocks: []
owners: [agent-coordinator]
reviewers: []
created: 2025-09-10
updated: 2025-09-10
acceptance:
  - Debug logging strategy defined (dev-only)
  - Diagnostic commands/toggles listed (dump board, queues)
  - Zero-cost or disabled in Release builds
---

# Context
Debuggability helps agents and humans triage issues quickly.

# Proposal
Use structured logs behind a compile-time or environment flag. Provide hidden key combos or commands to dump state. Ensure no performance hit in Release.

# Definition of Done
- Policy and toggles documented
