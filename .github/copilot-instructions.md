# Copilot coding agent instructions

This repository is RFC-driven. When working on issues/PRs, follow these rules:

Context
- Architecture: .NET 9 console app using Terminal.GUI v2, MVVM via ReactiveUI, System.Reactive.
- Testing: xUnit + FluentAssertions. Prefer small, focused tests.
- Package management: CPVM (Directory.Packages.props) with pinned versions.

Workflow
- Always implement against an approved RFC issue (label: rfc, ready). Extract the RFC ID from titles like "RFC-0003".
- Branch: copilot/fix-<issue-number> or rfc-<id>-<slug>.
- Keep PRs small and iterative: 3–5 files per batch, under ~300 LOC. Pause and post a checkpoint summary after each batch.
- Update RFC state automatically via existing workflows; do not hand-edit unless the workflow requests it.
- Ensure CI is green on every batch. Run: dotnet restore/build/test for the solution you add or modify.

Coding conventions
- Create or update Directory.Packages.props for CPVM; add Terminal.Gui, ReactiveUI, System.Reactive, xunit, FluentAssertions, etc., with pinned versions.
- Enable nullable and treat warnings as errors.
- Prefer MVVM; keep logic testable and UI thin.

Definition of done
- Build and tests pass in CI.
- RFC acceptance criteria satisfied and referenced in the PR body.
- Minimal docs update included (README/RFC notes) when behavior changes.

Anti-goals
- Avoid giant scaffolding PRs. Split large work into multiple batches.
- Don’t modify unrelated files or reformat wholesale.

If blocked
- Post a brief comment with what’s missing and propose a small next step.
# Copilot Coding Agent – Repository Instructions

Purpose
- This repo uses GitHub Copilot Coding Agent to evolve the project via RFCs with small, safe, test-verified changes.

Your job
- Establish and maintain the workflow so GitHub Coding Agent can correctly handle project development and evolve it the way we want (RFC-driven, small PRs, CI-enforced).
- Create and refine RFCs so the GitHub Coding Agent—acting as coordinator or implementor—can understand scope, dependencies, and Definition of Done, and then work accordingly.

Sources of truth
- RFC index: `docs/RFC/index.yaml` (IDs, dependencies, states: Draft → Approved → Implementing → Review → Done/Rejected)
- RFC docs: `docs/RFC/*.md` (decisions, DoD, constraints)
- Coordinator guidance: `AGENTS.md`

Operating principles
- Prefer small PRs (aim ≤ 5 files) unless the RFC allows larger.
- Tests-first bias. Ensure `.NET` restore/build/test is green locally and in CI before marking Done.
- Respect CPVM pins from `dotnet/Directory.Packages.props`; don’t add package sources without an RFC.
- Keep changes within the referenced RFC’s scope and update `index.yaml` state as part of the PR.

Coordinator actions you may take
- Read `docs/RFC/index.yaml`, compute ready RFCs (all `requires` satisfied), and open “Implement RFC” issues with task briefs.
- Create branches named `rfc-<id>-<short-slug>` and open draft PRs referencing the RFC and linking the issue.
- Assign labels: `rfc`, `agent:task`, `ready`, `blocked`, `in-progress` as appropriate.
- Post checkpoints after 3–5 file edits: list deltas, any errors, next steps.

Implementor actions you may take
- Implement only the files within the RFC scope; keep diffs small.
- Add/update tests in `dotnet/tests/*` to demonstrate acceptance criteria.
- Ensure build and tests pass; then move the RFC state to `Review` or `Done` as appropriate in `index.yaml` within the PR.

If RFCs are missing or incomplete
- Use `docs/RFC/TEMPLATE.md` to draft new RFCs; add them as `docs/RFC/NNNN-<title>.md`.
- Update `docs/RFC/index.yaml` with the new RFC’s `state`, `requires`, and `blocks` and open a PR.

How to respond to triggers
- Issues: Plan next RFCs; open Implement RFC issues with task briefs.
- PRs: Implement changes or address review feedback within RFC scope; re-run tests; update RFC state in `index.yaml`.

Notes
- No external API keys are required. Use first-party GitHub Copilot Coding Agent capabilities.
- Keep public repo hygiene: labels in sync, minimal secure workflows, and clear PR descriptions (use closing keywords like `closes #<issue>`).

## If your PR is behind or has conflicts (must do before Ready)

When GitHub shows your PR as “behind” or with merge conflicts, resolve it before marking Ready:

1) Rebase on main
	- Fetch latest: `git fetch origin`
	- Rebase: `git rebase origin/main`
	- Resolve conflicts (edit files), then `git add -A` and `git rebase --continue`
2) Validate locally
	- `dotnet restore`
	- `dotnet build -warnaserror`
	- `dotnet test`
3) Push with a tokenized remote (required for bots)
	- Set remote (note the `.git` suffix):
	  `git remote set-url origin "https://x-access-token:${GITHUB_TOKEN}@github.com/GiantCroissant-Lunar/falling-block-coding-agent.git"`
	- Push: `git push --force-with-lease`
4) If API is preferred, you may attempt `update-branch` via GitHub API; if it returns conflicts, fall back to the rebase steps above.
5) Once CI is green, mark the PR Ready for review.

If any step is blocked (auth, conflicts), post a concise comment describing the exact failing command and propose the next small step.
