# mona

Codename for the **Day Recap App** (working name): a phone app that listens when you ask, knows who said what, and turns each moment into the right output (meeting minutes, a trip journal, a reel), then hands back one short recap each evening. Audio and voice signatures stay on the phone; only pseudonymized text from flagged moments goes to the cloud.

The repository is at the specification stage. No app code exists yet.

## Docs

| Doc | What it is |
| --- | --- |
| [Implementation specification](docs/implementation-spec.md) | How we build it: architecture, modules, data model, API contracts, privacy invariants, Phase 0 and Phase 1 plans |
| [PRD](docs/product/prd.md) | What we build and why: positioning, scenarios, goals, metrics, journeys, feature requirements, release plan |
| [Feature deep dive and dev plan](docs/product/feature-deep-dive-and-dev-plan.md) | Earlier research: goals G1 to G7, features F1 to F7, cross-check, cost model. Superseded by the PRD where they differ |
| [How it works and user value](docs/product/how-it-works-and-user-value.md) | Personas, a day with the app, recap rules, pricing anchors, validation tests |

The product docs are snapshots of living Claude Docs documents; each file links to its canonical source at the top.

## Planned layout

```
app/        Flutter application
packages/   Native engines (capture, speech, media) and shared contracts
backend/    Supabase migrations and the gateway edge function
eval/       Evaluation harness for speaker, transcription and item accuracy
docs/       Specs and product docs
```

See [§4 of the spec](docs/implementation-spec.md#4-repository-layout) for details.
