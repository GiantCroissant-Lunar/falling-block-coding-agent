## Coding Agent Coordinator (Orchestration)

Role: reads RFCs, resolves dependencies, assigns small RFCs for parallel implementation, enforces quality gates.

Inputs:
- `docs/RFC/index.yaml` for dependency graph and groups
- RFC docs for decisions and acceptance criteria

Behavior:
- Prefer small PRs (1–2 PRs per RFC; <=5 files/PR) unless RFC allows larger
- Tests-first bias; run build/tests locally; summarize deltas and quality gates
- Respect CPVM and pinned versions; avoid network calls in code

States:
- RFC state machine: Draft → Approved → Implementing → Review → Done/Rejected
- Update `index.yaml` when states change

Task Brief (example)
- RFC: 0004 – Architecture (MVVM + Reactive)
- Goal: create solution structure and interfaces as per RFC DoD
- Files: dotnet/src/* projects, dotnet/tests/* projects, Directory.Packages.props
- Tests: scaffolding tests compile; at least 1 sanity test per project
- Quality gates: build + tests green locally and in CI

Prompts:
- “Implement RFC 0003: create Directory.Packages.props with pinned packages; add global.json if needed; ensure restore/build succeeds.”
- “Implement RFC 0006: scaffold Terminal.GUI views and bindings stubs; add Verify snapshot tests for initial frame.”

Checkpoints:
- After 3–5 file edits or major steps, pause and report: files changed, new warnings/errors, next actions.

Definition of Done (PR-level)
- Build clean; tests pass; minimal docs updated; RFC acceptance met.

## Assignment and Locking (How “taken” is determined)

An RFC is considered TAKEN when any of the following are true:
- An open Issue titled `[RFC-XXXX] Implement …` exists with label `agent:task` (one task issue per RFC)
- An open PR references `RFC-XXXX` in title/body
- `docs/RFC/index.yaml` marks the RFC state as `Implementing` or `Review`

Coordinator rules
- Do not open a new Implement RFC issue if one already exists or a PR references the RFC
- On first PR open referencing an RFC, set state to `Implementing` and add `in-progress` label on the task issue
- If CI is red > 60 minutes or no activity > 2 hours, add `blocked` and comment asking for a checkpoint; coordinator may split scope or open follow-up RFCs

Agent checkpoints
- After 3–5 file edits or 30 minutes, post a checkpoint comment (delta changes, problems, next steps)
- If blocked, apply `blocked` label and describe the blocker; coordinator will triage

## How to trigger the Coordinator

Prerequisites
- Enable Copilot Coding Agent for the repo/org (see GitHub docs) and keep `AGENTS.md` in the default branch.
- Keep `docs/RFC/index.yaml` current so the agent can resolve dependencies.

Recommended labels
- `agent:task`, `rfc`, `ready`, `blocked`, `coordinator` (create in repo settings → Labels).

1) Kick off planning or scheduling
- Open an Issue titled: "Coordinator: plan next RFCs from index.yaml"
- Body:
	- Context: link to `docs/RFC/index.yaml`
	- Ask: "Coordinator, compute the executable set (no unmet requires), propose 2–3 parallel tasks, and open issues for each with task briefs."
	- Constraints: PR size limits, file boundaries, DoD reminders.

2) Ask the agent to implement a specific RFC (Issue)
- Title: "[RFC-0003] Implement Toolchain & CPVM"
- Body (Task Brief): RFC link, acceptance criteria, files to touch, stop criteria (build+test green), checkpoints every 3–5 edits.
- Comment to start: "Coordinator, implement RFC 0003 per AGENTS.md. Create a branch and PR. Stop when quality gates pass and all acceptance criteria are met."

3) Drive work from a PR (Review/changes)
- On an open PR, comment:
	- "Coordinator, address review feedback A/B/C; keep changes within the RFC scope; re-run tests; update RFC state in `index.yaml`."
 - Include closing keywords in the PR description (e.g., `closes #<issue-number>`) so GitHub auto-closes the Implement RFC issue on merge.

4) Parallelization guidance
- Open one Issue per RFC ready to implement (dependencies satisfied). The agent can work on multiple Issues/PRs in parallel when scopes don’t overlap. Use `blocked` label for unmet `requires`.

5) State updates
- Ask in Issue/PR comments: "Coordinator, set RFC 0006 state to Implementing (or Done) in `docs/RFC/index.yaml` and commit that change in the PR."

Notes
- You don’t "create" long-lived agents; each Issue/PR comment invokes an agent run scoped to that thread. Concurrency comes from multiple active Issues/PRs.
- Clear DoD, allowed files, and acceptance criteria significantly improve outcomes.

## Policy: No manual merges by coordinators

- Implementation PRs must be merged by the Coding Agent (or the author) through normal readiness gates. Coordinators must not merge these PRs manually unless the repo owner explicitly requests an emergency hotfix.
- If a coordinator accidentally merges an agent PR, revert immediately and record the incident below.
- Rationale: Preserve agent autonomy and validate that workflows (nudges, rebase handling, CI gates) are sufficient for automated progress.

### Incident log

- 2025-09-10: Accidental manual merge of PR #27 ([RFC-0003] Batch 1: pin .NET 9 and enable CPVM). Action: reverted via commit a29959c on main. Follow-up: rely on the agent to advance PR #18 after rebase.

## Copilot Coding Agent (Autonomous commits with safety)

Purpose
- Use GitHub Copilot Coding Agent to evolve the repo with small, test-verified changes based on this AGENTS.md.

Enablement
- In repository Settings → Copilot → Coding Agent, enable for the repo (or at org level). Keep this `AGENTS.md` on the default branch.
- Optionally add custom instructions in this file (below) to steer style, scope limits, and quality gates.

How to trigger
- From an RFC Issue: comment with a clear ask, e.g. “Copilot, implement RFC 0003 per AGENTS.md. Create a branch and draft PR. Stop when build and tests are green.”
- From a PR: comment with changes, e.g. “Copilot, address review feedback A/B/C within RFC scope and re-run tests.”
- For planning: open an Issue asking “Copilot, plan next RFCs from docs/RFC/index.yaml and open Implement RFC issues.”

Safety and limits (the agent respects these when stated)
- Keep PRs small (<= 5 files or as specified in the task brief), favor tests-first, and ensure build/tests pass.
- Stick to CPVM pins, avoid unapproved dependencies, and update `docs/RFC/index.yaml` states when appropriate.
- Use checkpoints every 3–5 edits with a short summary comment.

Scope
- The agent makes incremental, low-risk changes aligned to an RFC’s DoD. For larger efforts, split into multiple small PRs.

Custom instructions for Copilot Coding Agent
- Prefer small, dependency-aware RFCs and parallelizable tasks.
- Enforce CPVM versions from `dotnet/Directory.Packages.props`.
- Keep changes within the RFC’s declared scope and DoD.
- Quality gates: .NET restore/build/test must be green locally and in CI before marking Done.

## Non-RFC Issues and Hygiene

- Non-RFC Issues (bugs, chores) are allowed. Prefer linking to an RFC if scope touches design; otherwise label as `needs-info` until actionable.
- The planner only considers RFC-backed work; non-RFC Issues won’t be auto-assigned to agents unless explicitly requested in comments.
- Stale triage runs daily: after 14 days inactive, issues/PRs are labeled `stale` and closed 7 days later unless `keep-open` is applied or there’s new activity.
- On PR merge, the RFC Implement issue is closed automatically; ensure PR titles/bodies include `RFC-XXXX` to link correctly.
	- Prefer GitHub closing keywords in PR descriptions (e.g., `closes #123`) so GitHub auto-closes issues on merge. Our workflow also closes the Implement RFC issue as a safety net.
