# UI design: Day Recap App (codename `mona`)

| | |
| --- | --- |
| Status | Draft v0.1, open for contributors |
| Date | 2026-10-25 |
| Canvas | https://claude.ai/artifact/8d6FrzHW22Gfw2oGSTVxLn (canonical; private until shared from its Share menu) |
| Published brief | https://claude.ai/artifact/QBbjWfwDQ92iL6jvDxU7Lu (a copy of this doc for agents; republish it after changing this file) |
| Snapshot | [`canvas/`](canvas/): the canvas files as of this doc's date, for agents that cannot open the canvas |
| Inputs | [PRD](../product/prd.md), [Implementation spec](../implementation-spec.md) |

This doc is the brief for anyone, human or agent, who designs screens for the app. It fixes the design direction, the tokens and components already in use, the screen list with owners and status, and the rules a screen must keep. A contributor should be able to pick an open screen from §6 and deliver it without asking.

---

## 1. Direction

**Function first.** The app borrows patterns from TikTok and Instagram where they help people find and check what happened, and drops them where they don't. When a familiar pattern and a clear answer to "what do I need to know?" conflict, the clear answer wins.

- **The day is a grid, like an Instagram profile.** Today is a 3-column grid of moment tiles, newest first, so the whole day is visible at once. A vertical one-at-a-time feed was tried and dropped: people want to scan several moments, not swipe through each.
- **One concise record button**, centered in the bottom bar (TikTok's create button), opens the shooting screen. Shooting itself has one large round button with modes switched by swiping (Audio / Video / Meeting).
- **The recap is one page you scan in about a minute**, not a sequence of cards. Everything is visible at once, in value order (promises by you, promises to you, decisions, things to remember, open questions, the highlight), with the most important line first and a count row that jumps to each section. Each item carries its due date, who, its source (tap to hear it) and the three feedback buttons in place. An Instagram-stories version (one card per item) was tried and dropped: it hid the overview and made checking ten items take ten taps.
- **No social layer.** Sharing between users is not planned, so there are no avatars of other people, stories rows, followers or likes. People appear only as speaker names inside moments. Sharing means exporting text (minutes, the recap) to other apps.
- **Audio moments still look like media.** Most moments have no video, so a tile or card shows the key quote in large type on a Scene-colored ground, with a waveform or duration. Video tiles show the clip.

Product principles from the PRD still hold and override style:

1. Recording state is never ambiguous (I2): the state pill is on every screen while capturing.
2. One main action per screen.
3. Sources everywhere (I9): every item opens its original line and audio.
4. Guess quietly, ask lightly: uncertain speakers show "?" (I12).
5. Calm by default.
6. Readable anywhere: dark UI, large text, VoiceOver.

## 2. Platform and frame

- iPhone, 390 × 844 artboards (one per screen), corner radius 44 on the canvas.
- Leave the top 58 px for the system status area and the bottom 34 px for the home indicator; never draw a fake status bar.
- Dark UI only in Phase 1. A light theme is not planned.
- Copy language: English first, Traditional Chinese (`lang="zh-Hant"`) second (spec D30). The app follows the device language and falls back to English. Draw new artboards in English; the existing artboards are in Chinese until redrawn. Every string lives in ARB files (spec §5.5), so keep copy short and literal, and check that the longer language still fits.

## 3. Tokens

Use these values; add a token here before using a new one.

**Color**

| Token | Value | Use |
| --- | --- | --- |
| `bg` | `#0B0B0F` | App ground |
| `bg-bar` | `#000000` | Bottom bar, shooting controls |
| `surface` | `#1A1A22` | Chips, round buttons on the ground |
| `overlay` | `rgba(0,0,0,0.45)` | Controls over media |
| `divider` | `#23232B` | Tab underline track, separators |
| `text` | `#FFFFFF` | Primary text |
| `text-2` | `#A8A8B3` | Secondary text, inactive tabs (passes 4.5:1 on `bg`) |
| `rec` | `#FF4D5E` | Recording: pill dot, record and stop buttons. The only red in the app. |
| `promise` | `#FFB37A` | Promise labels and item-count badges |
| `mark` | `#FFD66B` | Marked-moment star |
| `rec-pill` | `#26141A` | State pill background while recording |
| `tile-meta` | `#D5D5DC` | Time and meta text on moment tiles |
| `promise-ink` | `#2A1608` | Text on `promise` badges; due-date chip ground |

**Scene grounds** (tile and card backgrounds; white text passes on all)

| Scene | Value |
| --- | --- |
| Meeting | `#1C2740` |
| Call | `#173238` |
| Social | `#3A2416` |
| Show | `#2A1A3A` |
| Commute | `#23262E` |
| Solo note | `#2E2A16` |

**Speaker colors** (lanes, avatars). Also differ in lightness, so they never depend on hue alone: You `#5B8CFF`, B `#FFB37A`, C `#7ED6C1`, D `#C9A6FF`. More speakers reuse the set with a letter label.

**Capture states** (spec §6.2). Each has a color *and* a label, never color alone:

| State | Pill | Label |
| --- | --- | --- |
| Recording | `rec` dot on `rec-pill` | 錄音中 + elapsed |
| Paused | `text-2` dot, no fill change | 已暫停 + reason (家, 電量) |
| Private | `mark` dot | 私密至 14:30 |

**Type:** Inter for Latin, Noto Sans TC for Chinese (one stack: `Inter, 'Noto Sans TC', system-ui`). Sizes: 34–36 bold (story card, hero quote), 22 bold (screen title), 17–18 (section title, transcript), 13–15 (body, buttons), 11–12 (meta, tab labels). Nothing under 11.

**Shape and spacing:** 16 px side margins (20 on full-screen media), 2 px gaps in the grid, radii 12 (chips, bottom-bar record button), 14 (source cards), full round for round buttons and pills. Touch targets ≥ 44 px.

**Icons:** inline stroke SVG, 2 px stroke, 20–24 px, round caps. No emoji (the ★ glyph on tiles is a placeholder for an SVG star).

## 4. Components

Each is drawn on the canvas already; reuse it as it is.

| Component | Where it is | Rules |
| --- | --- | --- |
| State pill | Today, Live meeting | Top left; tap opens the live session. Always visible while capturing. |
| Bottom bar | Today | Five slots: 今天, 日曆, record button, 回顧, 我. The record button is a white rounded rectangle (52 × 40) with a `rec` dot, label-free; `aria-label="Start shooting"`. |
| View tabs | Today | Grid, items list, marked. Active tab: white icon and 2 px underline. |
| Moment tile | Today | 3 columns, 162 px tall, Scene ground. Top: type icon (waveform or play) and duration. Bottom: quote (2 lines, bold 13) and meta: time, item-count badge, mark star. Unanalyzed moments show their quote at 60% opacity. Every tile is one button whose accessible name is time + quote. |
| Record button (large) | Shoot | 76 px: 5 px white ring, `rec` fill. Becomes a `rec` rounded square while recording (stop). |
| Mode switcher | Shoot | Text tabs above the record button: 音訊, 影片, 會議. Active is white, others `text-2`. Meeting opens the consent card first (I10). |
| Round action button | Shoot, Live meeting | 44–52 px, `surface` or `overlay`, icon plus a label under it when there is room. |
| Transcript line | Live meeting | 4 px speaker-colored bar, speaker name in its color, text 18 px. Older lines fade. Uncertain speaker: name followed by " ?". |
| Recap summary card | Recap | Top of the page: the day's most important line in 18 px, then a 4-up count row (承諾, 決定, 記住, 問題) whose cells jump to their sections. |
| Recap item | Recap | `#15151C` card: the item in 16 px semibold; chips for due date (`promise` on `#2A1608`), who, and "? 說話者不確定" when uncertain; a source link (▶ moment and time) on the left and the feedback buttons on the right: ✓ (white fill when chosen), ✗, 不重要, each 44 px tall. |
| Section header | Recap | Section name in 13 px bold caps in its section color, count on the right. Colors: promises `promise`, decisions `#5B8CFF`, remember `#7ED6C1`, questions `#C9A6FF`, highlight `mark`. |

## 5. Rules every screen keeps

These come from the spec's invariants; a design that breaks one is not done.

- **I2, state visible:** any screen shown while capturing has the state pill.
- **I9, sources:** any item, summary or recap entry has a way to open its source line and audio.
- **I10, consent:** a Meeting can only start through the consent card.
- **I12, "?":** uncertain speakers and low-confidence items are marked, never shown as certain.
- **I13, Lock Screen:** Live Activity and notification designs show state and counts only, never transcript text, names or items.
- **Accessibility:** real buttons and links, `aria-label` on icon-only controls, text contrast ≥ 4.5:1 (3:1 at 24 px+), states told apart by label as well as color.
- **No invented data:** use the Mia day (user-value doc) as sample content; unknowns are `[PLACEHOLDER]`.

## 6. Screens

Status: **done** (on the canvas, reviewed by the user), **draft** (on the canvas, not reviewed), **open** (free to take), **claimed** (someone is on it; put your name or agent session in Owner).

| # | Screen | Artboard | Spec | Status | Owner | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | Today grid | `Main.dc.html` | §5.4 | draft | — | Replaced the vertical feed after review. Built in `app/lib/features/today/` (record button starts Day mode directly until Shoot is built) |
| 2 | Shoot | `Capture.dc.html` | §6.3, PRD J4 | draft | — | Show prompt chip, mark button |
| 3 | Live meeting | `Meeting.dc.html` | §5.4, §7.6 | draft | — | Stop = make minutes |
| 4 | Evening recap | `Recap.dc.html` | §9.3, §9.5 | draft | — | Rebuilt as one scannable page after review (the stories version hid the overview); 390 × 1560 to show the full scroll |
| 5 | Moment detail | `Moment.dc.html` | §5.4, §8.7 | open | | What a tile opens: media or quote on top, transcript by speaker, items, playback, fix tools (merge, split, reassign, relabel), delete |
| 6 | Items list tab | `Items.dc.html` | §8.5 | open | | Today's second tab: promises by you, to you, decisions, facts, questions; due dates; "?" items |
| 7 | Day-mode recording | `Recording.dc.html` | §6.2 | open | | Audio-only live view outside meetings: pill, live captions, pause, private, mark, stop |
| 8 | Paused and private states | `States.dc.html` | §6.2, §6.5 | open | | Pill and live-view variants for zone, battery, interruption, private-until |
| 9 | Consent card | `Consent.dc.html` | §13.1 | open | | Full-screen, can be turned toward the room; chime toggle; "Start" |
| 10 | Name speakers sheet | `NameSpeakers.dc.html` | §5.4 | open | | "Who is Speaker B?": attendees, recent names, system contact picker; plays a sample line |
| 11 | Recap: other states | `RecapStates.dc.html` | §9.3, §9.6 | open | | Quiet day (few items, says so), offline basic recap, generating (skeleton, under 30 s), an item marked wrong (hidden, with "wrong speaker" shortcut), adding a missed promise |
| 12 | Calendar (past days) | `Calendar.dc.html` | §5.4 Timeline | open | | Second tab of the bottom bar: month view, each day a thumbnail of its grid |
| 13 | Onboarding and "This is me" | `Onboarding*.dc.html` | §5.4, §7.7, §13.3 | open | | Scenes picker, what is recorded, mic, consent and enrollment, home zone (skippable), recap time, demo |
| 14 | Privacy center | `Privacy.dc.html` | §13.5 | open | | Two taps from Today (via 我) |
| 15 | Lock Screen and Live Activity | `LockScreen.dc.html` | §6.6, §9.4, I13 | open | | Recording, paused with Resume, private, stale "not recording", 8-hour keep-recording prompt, generic nudge notification |
| 16 | Me / settings | `Me.dc.html` | §5.4 People | open | | People, recap and nudge times, retention, export |

New screen ideas go at the bottom of this table as **open** with a one-line note.

## 7. How to contribute

1. **Claim** a screen: set its Status to **claimed** and Owner to your name or agent session in this file, in its own commit, before starting. One owner per screen.
2. **Read** §1 to §5, the spec sections in the row, and the existing artboards (on the canvas, or in [`canvas/`](canvas/) if you can't open it).
3. **Build** on the canvas when you can open it (Design artifact; one `.dc.html` artboard per screen, 390 × 844, placed in the row at `y = 0` after the last artboard, 80 px apart). Use only §3 tokens and §4 components; if you need a new component, add it to §4 in the same change.
4. **Snapshot**: copy your artboard's source into [`canvas/project/`](canvas/project/) and add it to `canvas.json` there, so the repo stays in step with the canvas.
5. **Hand back**: set Status to **draft**, add a line of notes (what you assumed, what is left). The user reviews and marks it **done**.

Agents that cannot open the private canvas work in `canvas/project/` directly, in the same `.dc.html` format, and say so in the notes; the user copies the file onto the canvas.

Don't change another owner's screen; leave a note in its row instead.

## 8. Open questions

- [ ] With the grid on Today, does the bottom bar still need a separate "Timeline"? This draft turned that slot into a calendar of past days.
- [ ] What does a tile open: the moment detail directly, or a full-screen viewer (swipe between moments, like opening a post on a profile) with the detail below?
- [ ] Are video tiles shown in the same grid as audio moments, or does the Show Scene get its own reel row?
- [ ] Should the recap's top line be written by the model ("the most important thing today") or picked by a rule (the earliest-due promise)?
- [ ] App icon, name and brand: blocked on the product name (PRD open question).
