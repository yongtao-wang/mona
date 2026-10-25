# mona — Agent Guide

Codename for the Day Recap App: an iPhone app (Android later) that records conversations the user starts, knows who said what, and hands back one short recap each evening, with promises, decisions and things to remember. Audio and voice signatures stay on the phone; only pseudonymized text goes to the cloud. The repo is at the specification and design stage: there is no app code yet. Planned stack: Flutter app with native Swift engines for capture and speech, Supabase (Postgres, a Deno/TypeScript edge-function gateway), and a Python evaluation harness. Nothing is deployed.

## Commands

- None yet. The repo holds docs only. The planned commands per package are in [the spec, §17](docs/implementation-spec.md#17-testing-and-ci).

## Verifying work

- Docs: links and `#anchors` resolve, every Markdown table row has the header's column count (a `|` inside backticks still splits a cell on GitHub), and Mermaid blocks parse.
- Spec changes: a new choice gets a row in §21 Decisions; a finding from a review gets a row in §24 Review log; section numbers and the contents list stay in step.
- Screens are proven on the design canvas (Play), not by reading their source.

## Repository layout

- `docs/implementation-spec.md` — how the app is built: invariants I1 to I13, architecture, data model, API contracts, Phase 0 and Phase 1 plans.
- `docs/product/` — PRD and research docs, snapshots of Claude Docs documents.
- `docs/design/` — the UI design brief (`ui-design.md`) and a snapshot of the design canvas (`canvas/project/`).
- `app/`, `packages/`, `backend/`, `eval/` — planned, not created yet; see [spec §4](docs/implementation-spec.md#4-repository-layout).

## Conventions

- The PRD wins over the older dev plan; the spec records how it resolves each conflict (§1.2).
- The privacy invariants I1 to I13 in [spec §2](docs/implementation-spec.md#2-invariants) are not negotiable; a design or code change that breaks one is not done.
- Work is estimated in agent hours; the calendar is set by device tests, user studies, review and third parties ([spec §19.1](docs/implementation-spec.md#191-how-time-is-estimated)).
- The product docs are snapshots: each links its canonical Claude Docs source at the top. Change the source first, then re-export the snapshot.
- Writing: plain words, short sentences, tables for comparisons. No model identifiers in code, docs or commit messages except where the spec names a provider candidate.
- UI: use only the tokens and components in [docs/design/ui-design.md](docs/design/ui-design.md); claim a screen there before designing it.

## Gotchas

- In cloud sessions `gh auth status` reports the token as invalid, but `gh` calls work through the session's proxy. Check with `gh api user -q .login`.
- Cloud sessions also block GitHub's GraphQL API, which `gh issue` and `gh label` use. There, use the REST API: `gh api repos/yongtao-wang/mona/issues` (list, add `-f title=... -f body=... -f 'labels[]=auto'` with `-X POST` to create), `gh api -X PATCH repos/yongtao-wang/mona/issues/N -f state=closed`, `gh api repos/yongtao-wang/mona/labels`. Deleting an issue needs GraphQL, so there "drop" closes it as not planned (`-f state_reason=not_planned`) instead.
- The design canvas and the published design brief are private Claude artifacts. Agents under other accounts can't open them until they are shared; they work from `docs/design/` instead.
- The published design brief is a copy of `docs/design/ui-design.md`; republish it after changing the file.

## Agent harness

- Skills are installed with the `skills` CLI: files in `.agents/skills/`, `.claude/skills/` links to
  them, versions in `skills-lock.json`. Update with `npx skills update`; never edit an installed
  skill in place — change it at its source repo.
- `CLAUDE.md` only imports this file.
- Backlog: the repo's open GitHub issues (`gh issue list`). Add, close or drop one with the
  `backlog-gh` skill.


## Agent skills

### Issue tracker

Issues live in the repo's GitHub Issues (`yongtao-wang/mona`); cloud sessions use the REST API. See `docs/agents/issue-tracker.md`.

### Domain docs

Single-context: one `GLOSSARY.md` and `docs/adr/` at the repo root, created when there is something to put in them. See `docs/agents/domain.md`.

## Docs

- [docs/implementation-spec.md](docs/implementation-spec.md) — implementation spec
- [docs/product/prd.md](docs/product/prd.md) — PRD
- [docs/product/feature-deep-dive-and-dev-plan.md](docs/product/feature-deep-dive-and-dev-plan.md) — earlier research and dev plan
- [docs/product/how-it-works-and-user-value.md](docs/product/how-it-works-and-user-value.md) — personas, a day with the app, recap rules
- [docs/design/ui-design.md](docs/design/ui-design.md) — UI design brief
- [docs/agents/](docs/agents/) — how the engineering skills use the issue tracker and domain docs
