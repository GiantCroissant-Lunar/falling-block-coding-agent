---
id: 0008
title: Testing strategy
state: Draft
group: core-logic
requires: [0003,0004,0005]
blocks: [0010]
owners: [agent-coordinator]
reviewers: []
created: 2025-09-10
updated: 2025-09-10
acceptance:
  - xUnit v3 + NSubstitute + FluentAssertions, Verify for snapshots (optional)
  - Unit tests focus on rules, rotation, scoring; minimal snapshot of board states
  - Test utilities and fixtures outlined
---

# Context
Strong tests enable safe agent automation and refactors.

# Proposal
Define test pyramid; per-project test projects; Verify snapshots for board/string frame rendering; property tests optional.

# Alternatives
End-to-end-only tests would be brittle; we prefer layered.

# Definition of Done
- Test patterns and folder conventions documented
