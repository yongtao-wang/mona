# Day Recap App: Feature Deep Dive and Dev Plan

Oct 20, 2026 · YW

> Repository snapshot of the Claude Docs research doc (tab 1 of 2), exported 2026-10-25.
> Canonical, editable source: https://claude.ai/artifact/T4jTSpLntKQhYshqF1y32w
> This doc came before the [PRD](prd.md). Where they disagree (stack, phases, team, timeline), the PRD wins.
> Its two embedded diagrams (pipeline and roadmap) are not reproduced; the PRD's architecture and release plan replace them.

Seven features carry the original promise of recording a day and getting it back as a recap. Two goals are only partly met by what phones allow, so the plan is built around those gaps.

How the app works day to day, who it serves and the value it brings: [How it works and user value](how-it-works-and-user-value.md).

## Original goals and what they require

Your brief contains six goals. We add a seventh, trust, because the research showed it is where competitors lost users.

| # | Goal (from your brief) | What it really requires |
| --- | --- | --- |
| G1 | User turns on camera or mic and it keeps recording | Capture that survives the screen turning off, the phone locking and a full day of battery |
| G2 | App transcribes or identifies what happened | Speech-to-text, plus a way to label scenes (meeting, commute, show, meal) |
| G3 | End-of-day summary | Stitch many segments into one accurate, checkable recap |
| G4 | Meeting: summarize as transcript | Speaker labels, decisions, action items |
| G5 | Show: create a TikTok-fit clip | Find the best moment, crop to 9:16, add captions, export |
| G6 | Useful and fun | A reason to open the app daily, and something worth sharing |
| G7 | Trust (added) | Consent, privacy, data control, App Store and legal compliance |

## Major features and why we build them

Each feature below states the reasoning, how it works, and which goals it serves.

### F1. Two-mode capture: Day mode (audio) and Moment mode (video)

**Why.** G1 asks for continuous camera or mic. Phones allow the first and not the second. On iOS, background audio only continues if recording started in the foreground, and the camera cannot run in the background at all. Pretending otherwise gets the app rejected or killed. So we split capture in two.

- **Day mode:** one tap starts audio capture that continues with the screen off. Quick start from a Lock Screen widget, Action Button and Apple Watch.
- **Moment mode:** foreground camera for the things worth filming (a show, a trip, a kid's first steps), with a prompt when the app thinks one is happening.
- **Battery guard:** voice-activity detection so silence is dropped, compressed audio, and auto-pause when battery is low.

Serves G1, G2, G5.

### F2. Understanding pipeline: transcript plus "what happened"

**Why.** G2 needs more than words. A transcript of a commute and a transcript of a meeting look the same unless the app knows context. Cost also forces a design choice: cloud transcription of hours of speech per day would cost more than a subscription brings in (see Cost section).

- **On-device:** speech detection, transcription, speaker separation, audio-event tags (applause, music, laughter, traffic).
- **Cloud, only on flagged segments:** an LLM labels each segment (meeting, social, commute, show, solo), names topics and extracts people, places and commitments. For video, sample a frame every few seconds and caption only the moments the audio marks as interesting.
- **Confidence and correction:** low-confidence labels show a one-tap "is this right?" so errors get fixed instead of buried.

Serves G2, G3.

### F3. Day timeline and end-of-day recap

**Why.** This is the headline promise (G3) and the daily habit. Competitors already produce bullet summaries, so ours must be more checkable and more complete.

- A scrollable **timeline** of the day: segment title, time, place, people, a two-line summary.
- A **recap at a time the user picks** (default 9 pm): highlights, decisions, things you promised, follow-ups, time spent in meetings versus social.
- **Every claim links to its source** moment, so the user taps to read or hear it. This is the main defense against made-up details.
- **Ask your day:** "what did the landlord say about the deposit?" answered from the transcripts.

Serves G3, G6.

### F4. Meeting mode

**Why.** G4 is the strongest paid use case, since meeting tools are an established category. Our edge is that it is part of the day timeline and needs no bot joining the call.

- Auto-offer when a calendar event starts or when multi-speaker conversation is detected.
- Speaker-labeled transcript, summary, decisions, action items with owners, and a draft follow-up message.
- A **consent prompt** to share with others, and a visible recording indicator.

Serves G4, G7.

### F5. Show and event clip maker

**Why.** G5 is the feature people will show their friends, and it is the growth loop. Clip tools exist, but they work on uploaded long videos and know nothing about the user's day.

- **Find the peak:** score candidate 15-30 second windows using crowd noise, music energy, camera motion and steadiness.
- **Format:** reframe to 9:16, add captions for speech, offer three variants to pick from.
- **Export:** save, or hand off to TikTok, Reels or Shorts.
- **Rights note:** concert audio can be muted or blocked by platforms, so we warn before export and offer a "voice and visuals only" version.

Needs footage from Moment mode. Serves G5, G6.

### F6. Fun layer

**Why.** A summary is a commodity, so retention needs something people want to look at and share (G6). The one-second diary apps prove people like a visual record, but they depend on manual effort.

- **Day trailer:** a 30-second reel built from the day's best clips, photos and quotes.
- **Daily awards:** funniest quote, longest conversation, busiest hour.
- **Streaks, weekly recap and a year in review.**
- **Shareable day card** for stories.

Serves G6.

### F7. Trust and privacy layer

**Why.** G7. When Limitless was bought by Meta, users in several regions lost service on short notice and everyone faced new data terms. Always-on recording also raises bystander consent questions that can decide App Store approval and legal exposure.

- Local-first storage; cloud backup is opt-in and encrypted.
- **Auto-delete raw audio and video** after a set number of days, keeping only summaries and chosen clips.
- **Pause zones:** auto-pause at home, in bathrooms or at places the user marks.
- Visible recording indicator, optional spoken or chime consent notice, and a bystander mode that blurs faces and mutes other voices in exported clips.
- One-tap export and delete of everything. A plain statement that user data is never used for training.

Serves G7, and protects G1 through G5.

## Cross-check: do the features fulfill the original goals?

Four goals are met (two of them conditionally), G2 is mostly met, and G1 and G5 are met only in part. Every feature maps to at least one goal, so nothing is scope creep. The gaps come from phone limits, not from design choices.

| Goal | Delivered by | Verdict | Gap found | Fix built into the plan |
| --- | --- | --- | --- | --- |
| G1 Keep recording camera or mic | F1, F7 | Partly | Audio can run all day only if started in the foreground, and the system can still stop it. Continuous video is not possible. | Day mode for audio, Moment mode for video, a restart nudge if capture stops, wearables and Watch later |
| G2 Transcribe and identify what happened | F2 | Mostly | Speech is well covered. Scene identification from sampled frames can miss things. Noisy rooms and mixed languages hurt accuracy. | Confidence scores, one-tap corrections, language tests in Phase 0 |
| G3 End-of-day summary | F3 | Met, if accurate | An LLM can invent details. A day with little speech gives a thin recap. | Every claim links to its source. Calendar, location and photos feed in as extra signals. |
| G4 Meeting summary | F4 | Met | Other attendees may not know they are recorded. Speaker labels can be wrong in a room. | Consent prompt, name speakers once and remember them |
| G5 TikTok clip of a show | F5 | Partly | Clips need video, which needs the camera open in the foreground. Concert audio may be muted by platforms. | A "show detected, open camera?" prompt, a mark-this-moment button, and an audio-and-photos fallback clip |
| G6 Useful and fun | F3, F5, F6 | Met on paper, unproven | We do not yet know people will open a recap every day. | A fake-door test and a daily recap open-rate gate before building more |
| G7 Trust | F7 | Met in design | Consent law differs by country and state. | Per-market rules and a legal review before launch |

**What the cross-check changed in the plan:**

- Moved the show detection prompt and mark-this-moment button into the MVP, because without them G5 cannot work from Day mode alone.
- Made source links on every recap claim a launch requirement, not a nice-to-have.
- Added a Phase 0 feasibility phase so the two partly met goals are tested on real devices before we commit.

## Architecture

The heavy and private work happens on the phone. The cloud sees only text and a few frames from segments the phone flags as worth labeling.

Clips and the day trailer are rendered on the phone, so raw video never has to leave it. Meeting notes and the recap are produced in the cloud from transcripts only.

## Dev plan

The build takes about 30 weeks in five phases. Phase 0 exists to test the two partly met goals before real money is spent, and Gate A is the one that matters most.

Each gate is a stop-or-go decision. Missing a gate means fixing or narrowing the product, not starting the next phase.

### Stack and team

| Layer | Choice | Why |
| --- | --- | --- |
| iOS app | Swift and SwiftUI, native audio and camera APIs | Background audio and camera control need native code. iOS first, because its background rules are the strictest. |
| On-device speech | A Whisper-class model or the platform speech API | No per-minute cost and audio stays on the phone. Test mixed Mandarin and English in Phase 0. |
| Clips and trailer | Rendered on the phone with Apple's video framework | Raw video never leaves the device. |
| Backend | Postgres, object storage, a queue and a small Python worker. Supabase fits the MVP. | Auth, database and storage in one place, cheap to start. |
| LLM | A strong model for labeling and recaps, a cheaper one for routine segments | Controls cost. Prompts must force source citations. |
| Android | Kotlin with a visible foreground service | Built from Phase 3, after the iOS lessons. |

**Team:** two engineers (iOS, and backend with ML), a part-time designer, and you leading product and user interviews. Rough effort is two engineers for 30 weeks.

**Starting targets for the gates.** These are proposals to be set with real measurements in Phase 0, not findings:

- Battery: 8 hours of Day mode costs 15% or less.
- Transcript word error rate: under 15% for quiet, close speech in the target languages.
- Cost: model and storage cost per active user stays under 20% of the plan price.

## Cost, success metrics and risks

On-device transcription keeps server cost to roughly $4 to $10 per active user per month. The biggest risks are iOS capture reliability and recap accuracy.

### Cost per active user per month

Assumed heavy user: 6 hours of Day mode a day, with 2 hours of actual speech. These are rough estimates from stated assumptions, to be replaced by measurements in Phase 0.

| Item | Assumption | Estimate |
| --- | --- | --- |
| Cloud transcription (what we avoid) | 2 hours of speech a day at about $0.006 per minute (list price recalled from memory, verify) | about $22 |
| On-device transcription (our plan) | Runs on the phone | $0 server cost, paid for in battery |
| LLM labeling and recaps | About 100,000 input tokens a day at an assumed $1 to $3 per million | about $3 to $9 |
| Storage of flagged audio and transcripts | Under 1 GB a month. Compressed audio at 24 kbps is about 65 MB for 6 hours. | under $1 |

At $4 to $10 of server cost, a plan priced around $10 to $15 a month would leave margin. That price is a hypothesis to test in the beta.

### Success metrics

- **Habit (main):** days per week the recap is opened. Gate B target: 5 or more for half of alpha users.
- **Accuracy:** share of recap claims that users mark wrong. Aim for under 5%, and every claim stays linkable to its source.
- **Meeting value:** share of meeting notes rated useful.
- **Virality:** share of exported clips that get shared. Gate D target: one third.
- **Trust:** consent prompt completion, deletion and export requests, and zero store-review or legal blockers.

### Risks

| Risk | Impact | Mitigation | Early signal |
| --- | --- | --- | --- |
| iOS stops background capture or the App Store rejects the approach | High | Foreground start, visible indicator, honest purpose text, test early in Phase 0 | Capture drops in the 8-hour test |
| Battery drain makes people stop using Day mode | High | Voice-activity detection, low-power model, auto-pause at low battery | More than 15% drain per 8 hours |
| Recap invents details | High | Source links on every claim, a confidence label, a one-tap wrong button | Users tap wrong on more than 5% of claims |
| Consent law and bystander privacy | High | Indicator, consent prompt, pause zones, per-market rules, legal review before launch | Complaints, or a store flag |
| Concert audio is muted on TikTok or blocked by the venue | Medium | Warn before export, voice-and-visuals version, user owns the posting decision | Muted or removed exports |
| Mixed-language speech lowers accuracy | Medium | Test your real languages in Phase 0, allow per-segment language choice | Word error rate above target |
| Apple, Meta or Amazon add similar features to their devices | Medium | Compete on trust, cross-platform use and the clip and trailer loop | A platform announcement |

## Open questions that change the plan

- [ ] **Is moment-based video acceptable?** Continuous video is not possible on phones, so G1 is met for audio only. If you need all-day video, the plan must add a wearable camera or smart glasses, which changes cost and timeline.
- [ ] **Which country and languages first?** This sets the speech model, the consent rules and the legal review. I do not know your launch market, and an earlier note of mine assumed a US state rule without basis.
- [ ] **iOS first, or both platforms at once?** Both at once adds roughly 8 to 10 weeks.
- [ ] **Who builds it?** The plan assumes two engineers. A solo builder should drop Phase 3 features and ship Phases 0 to 2 first.
- [ ] **Subscription or one-time price?** Ongoing model cost favors a subscription.
- [ ] **Do you want the fun layer in the MVP?** The plan holds it back until the recap habit is proven, but the day trailer could move earlier if you want a stronger demo.
