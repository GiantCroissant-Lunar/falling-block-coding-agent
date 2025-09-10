---
id: 0003
title: Toolchain & CPVM
state: Draft
group: bootstrap
requires: [0002]
blocks: [0004,0008,0010]
owners: [agent-coordinator]
reviewers: []
created: 2025-09-10
updated: 2025-09-10
acceptance:
  - Decide .NET SDK 9.x baseline and langversion
  - CPVM via `Directory.Packages.props` with pinned versions
  - Package set: Terminal.Gui v2, ReactiveUI, System.Reactive, xUnit v3, NSubstitute, FluentAssertions, Verify (optional)
  - Compiler settings: nullable, analyzers, warnings-as-errors policy
---

# Context
Central package management and a consistent toolchain enable reproducible builds.

# Proposal
Create `dotnet/Directory.Packages.props`, pin versions, and codify analyzer settings. Adopt `global.json` if needed to lock SDK.

# Alternatives
Per-project PackageReference risks drift; we prefer CPVM.

# Definition of Done
- Props file drafted
- Version update policy documented (monthly or on demand)
