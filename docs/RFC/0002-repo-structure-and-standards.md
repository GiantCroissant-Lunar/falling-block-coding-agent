---
id: 0002
title: Repo structure & public standards
state: Draft
group: bootstrap
requires: [0001]
blocks: [0003,0010]
owners: [agent-coordinator]
reviewers: []
created: 2025-09-10
updated: 2025-09-10
acceptance:
  - Directory layout documented for src/tests/docs
  - Public repo policies listed (license, conduct, contributing, security)
  - Issue/PR templates outline
---

# Context
Consistent layout and public repository hygiene enable agent collaboration.

# Proposal
Adopt: `dotnet/src/*`, `dotnet/tests/*`, `docs/RFC`, `AGENTS.md`. Include LICENSE (MIT), CODE_OF_CONDUCT, CONTRIBUTING, SECURITY, and templates.

# Alternatives
Mono-repo at root without `dotnet/` could blur scopes.

# Dependencies
Requires vision; unblocks toolchain and CI.

# Definition of Done
- README shows tree
- Governance files sketched (stubs acceptable)
