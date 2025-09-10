---
id: 0005
title: Game design rules (SRS, scoring, levels)
state: Draft
group: core-logic
requires: [0004]
blocks: [0007,0008]
owners: [agent-coordinator]
reviewers: []
created: 2025-09-10
updated: 2025-09-10
acceptance:
  - Define piece set, bag randomizer, movement/lock rules
  - SRS rotation and wall kicks documented with examples
  - Scoring and level speed table for v0.1.0
---

# Context
Consistent rules are needed for gameplay and deterministic tests.

# Proposal
Adopt standard 7-bag randomizer, SRS rotations, T-Spin recognition (optional for v0.1.0), scoring and levels similar to Guideline Tetris simplified for console.

# Definition of Done
- Tables and examples included; unit test cases enumerated
