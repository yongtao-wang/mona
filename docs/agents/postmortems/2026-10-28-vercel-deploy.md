# Vercel dev preview went to a public production domain (2026-10-28)

## What happened

Deploying the web dev preview (spec D33) to Vercel, the agent created project `mona-preview` with one
`create_deployment` call: Git source = the feature branch `claude/optimistic-curie-6c8gpr`, no `target`.
Vercel made it a **production** deployment. The project's default protection
(`all_except_custom_domains`) left the production domain `mona-preview.vercel.app` public. The user had
asked for "only me".

Exposed: the static app with sample data, and the gateway with the fake model, an in-memory store and the
dev token baked into the app. No API key, no real data, no cost.

Fixed on 2026-10-31: project protection set to `all`. Anonymous requests to `/` and
`/api/gateway/v1/config` on all four hostnames now redirect to the Vercel login; an authenticated request
reaches the gateway.

## Why it went to production

The Vercel docs for the tool say "omit `target` for a preview". The tool's own schema says that without a
target the environment is "inferred from the branch". The project was new, created by the same call, with
no Git link and so no production branch configured, and Vercel inferred production. The exact rule it
applied is unconfirmed: the documented behavior and the result disagree.

## Mistakes

| # | Mistake | Should have |
| --- | --- | --- |
| 1 | Left out `target`, trusting "omit target for a preview" in the docs, although the tool schema says the target is inferred from the branch | Pass `target: "preview"` explicitly |
| 2 | Ignored `"target": "production"` in the create response | Read the response and stop on a mismatch |
| 3 | Planned to check protection after deploying | Check (or set) protection before the first deploy; a new project's default does not cover production `vercel.app` domains |
| 4 | Told the user only they could open it before verifying | Claim access control only after an unauthenticated request is refused |
| 5 | First tried to push ~9 MB of build output through the MCP upload tool, whose input is base64 in the call | Check a tool's input shape before choosing it for large payloads |
| 6 | Twice ran `pkill -f <pattern>` with a pattern that matched the agent's own shell, killing the command | Kill by PID from `pgrep`, never with `pkill -f` on a string the command line contains |

## Rules to keep

Not in AGENTS.md: they are specific to deploying. Candidates for a deploy skill.

- Every Vercel deploy passes `target: "preview"` and checks `target` in the response.
- Project protection is `all` before a link is shared, verified with an unauthenticated `curl`.
- Kill processes by PID (`pgrep`, then `kill`), never `pkill -f` on a string in your own command line.
