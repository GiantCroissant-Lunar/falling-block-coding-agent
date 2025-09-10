---
id: 0006
title: UI/Rendering with Terminal.GUI v2
state: Draft
group: ui-terminal
requires: [0004]
blocks: [0012]
owners: [agent-coordinator]
reviewers: []
created: 2025-09-10
updated: 2025-09-10
acceptance:
  - View tree, input map, and rendering update strategy documented
  - Color scheme and layout for board, next queue, hold, score, status bar
---

# Context
Terminal.GUI v2 provides a portable TUI with views, events, and colors.

# Proposal
Define views: GameBoardView, NextQueueView, HoldView, ScorePanel, StatusBar. Specify update triggers (invalidate on state diffs) and input mapping.

# Alternatives
Manual console painting would be lower-level and more error-prone.

# Definition of Done
- Wireframe and event/update contract included
