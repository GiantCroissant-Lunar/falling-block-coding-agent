---
id: 0007
title: Input & timing model
state: Draft
group: core-logic
requires: [0004,0005]
blocks: [0012]
owners: [agent-coordinator]
reviewers: []
created: 2025-09-10
updated: 2025-09-10
acceptance:
  - Define logic tick cadence and render throttling
  - Input stream normalization and key repeat policy
  - Pause/resume semantics
---

# Context
Deterministic logic ticks and normalized input are key for fair play and tests.

# Proposal
Logic ticks via IObservable<long> with schedulers; render throttled independently. Key streams mapped to commands; soft/hard drop handling; DAS/ARR policies.

# Alternatives
Game loop in a while loop couples timing and rendering.

# Definition of Done
- Timing chart and interfaces for tick provider and input pipeline
