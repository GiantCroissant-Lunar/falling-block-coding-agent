---
id: 0004
title: Architecture (MVVM + Reactive) & solution layout
state: Draft
group: core-logic
requires: [0001,0003]
blocks: [0005,0006,0007,0008]
owners: [agent-coordinator]
reviewers: []
created: 2025-09-10
updated: 2025-09-10
acceptance:
  - Projects defined with responsibilities and public contracts/interfaces
  - Reactive patterns chosen: IObservables, ReactiveCommand, view-model state
  - View-model state uses ObservableCollection for board/cell rows
---

# Context
We need a clear split of core rules, UI, and app composition, using ReactiveUI.

# Proposal
Projects:
- Core: rules, board, tetrominoes, scoring, RNG, timing contracts
- UI.Terminal: Terminal.GUI v2 views and bindings
- App: composition root and DI
Tests per project.

# Alternatives
Monolith project conflates concerns and complicates tests.

# Definition of Done
- Interfaces for timing, input, and game services drafted
- Solution layout diagram included
