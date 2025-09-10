---
id: 0001
title: Vision & scope
state: Approved
group: bootstrap
requires: []
blocks: [0002,0004,0011]
owners: [agent-coordinator]
reviewers: []
created: 2025-09-10
updated: 2025-09-10
acceptance:
  - Vision describes goals, non-goals, and success metrics for v0.1.0
  - Scope lists minimum features for a playable Tetris in terminal
  - Risks and constraints captured (console-only, .NET 9, cross-platform)
---

# Context
We are building a console TUI Tetris using .NET 9, Terminal.GUI v2, and a Reactive MVVM architecture. Work will be agent-driven and public.

# Proposal
Document clear goals (fun, responsive, readable TUI), non-goals (no graphics beyond TUI), and v0.1.0 scope: bag randomizer, movement, rotation (SRS), line clear, level speed, scoring, basic UI.

# Alternatives
- Rich UI frameworks (WPF/WinUI) are out of scope.
- Non-reactive patterns increase coupling; we choose ReactiveUI.

# Dependencies
Unblocks repo structure, architecture, and agent workflow.

# Definition of Done
- Vision and scope approved in PR
- README top section references this RFC

# Rollout / Follow-ups
Follow with repo structure and coordinator RFCs.
