# How the App Works and Why Users Care

Oct 24, 2026 · YW

> Repository snapshot of the Claude Docs research doc (tab 2 of 2, "How it works and user value"), exported 2026-10-25.
> Canonical, editable source: https://claude.ai/artifact/T4jTSpLntKQhYshqF1y32w
> The embedded "daily habit loop" diagram is rendered below as a list.

The app is worth keeping if it does three jobs well: keep the promises and details people would otherwise lose, let them stay present instead of taking notes or filming, and hand back a few moments worth keeping. Every part of the design below serves one of those three jobs.

## The problem worth solving

People forget most of what is said to them, lose attention to note-taking and filming, and rarely go back to what they record. Each row below is a pain the app has to fix, with the evidence and the design answer.

| Pain | Evidence | What the app does |
| --- | --- | --- |
| Conversations fade within days | In a lab study, pairs jointly recalled only about 4.7% of a conversation's details a week later. The partner who wrote notes recalled 18% versus 13% for the other. | Records the conversation and turns it into a short recap the same evening |
| Promises and to-dos slip | Reviewers single out Bee's daily list of commitments and follow-ups as its most useful part | Puts "things you promised" at the top of every recap, with a reminder the morning they are due |
| Note-taking and filming steal attention | In a UK survey of 1,100 gig-goers, 41% said they missed key parts of a show while filming. A Heineken survey found 55% of Gen Z and Millennials had prioritized filming over being present. | Capture runs hands-free. At shows, a "mark this moment" tap replaces long filming. |
| Recordings go unused | 28% in that UK survey never rewatch concert videos. Plaud notes that reviewing long recordings is too time-consuming for many ADHD users to sustain. | The app does the reviewing: a recap you can read in about a minute, and a reel made for you |
| Today's recorders give uneven returns | Reviewers say Bee's summaries sometimes fixate on the wrong thing while generating a lot of data | Fewer items, ranked by value, each linked to the moment it came from |
| Other people object | An early Bee user's partner banned it at home. A reporter testing several devices found asking everyone for consent all day a real burden. | Pause zones, a private-mode tap, a visible indicator and consent prompts in Meeting mode |

These are small studies and single surveys, so treat them as direction rather than proof. The validation section near the end tests them with real users.

## Who it is for

Four groups get clear value. Launch for the first two, because they feel the pain daily and already pay for tools like this. The third group drives growth through shared clips.

| Persona | Their day | The job they hire the app for | First "aha" moment | Will they pay? |
| --- | --- | --- | --- | --- |
| **The juggler** (founders, managers, sales, consultants) | Back-to-back meetings and calls, many small promises | Never drop a commitment; meeting notes with no bot in the call | The first evening recap lists a promise they had forgotten | Yes. Many already pay for Otter or Plaud. |
| **The overloaded mind** (people with ADHD or heavy memory load, by their own description) | Details slip away while they are still listening | An outside memory that needs no filing | Asking "what time did the plumber say?" and getting the answer with the audio | Likely. Plaud and Fieldy already market to this group. |
| **The experience collector** (students, Gen Z, travelers, fans) | Shows, trips, nights out | Stay present and still get a clip worth posting | A reel ready before they get home | Low on their own, but their shared clips bring in new users |
| **The family keeper** (parents) | Kids' firsts, family dinners | Keep small moments without filming everything | A weekly family reel | Medium. A later step, and it needs extra privacy care for children. |

Students also fit the juggler pattern for lectures, using Meeting mode.

**Not for:** secret recording, recording people who have not agreed, or workplaces and venues that ban recording. The app should make these uses harder, not easier.

## A day with the app

The user starts capture once in the morning and does nothing else until the evening recap. Below is a typical day for a fictional user, Mia, a product manager in Taipei who switches between Mandarin and English at work.

| Time | What Mia does | What the app does | What she gets |
| --- | --- | --- | --- |
| 08:40 Commute | Taps the Lock Screen widget | Starts Day mode, skips silence, transcribes on the phone | Nothing to manage |
| 10:00 Standup | Her calendar event begins | Offers Meeting mode and plays a short consent chime when she accepts | Speaker-labeled notes and three action items by 10:20 |
| 12:30 Lunch with a friend | Chats | Labels it "social" and, per her setting, keeps only a two-line summary | Her friend's job news and a book tip, saved |
| 14:00 Vendor call | Agrees to send specs by Thursday | Detects a commitment, who made it and when it is due | "You promised: send specs to the vendor by Thursday" |
| 18:30 Home | Walks in the door | Her home is a pause zone, so recording stops by itself | Privacy at home without remembering to switch off |
| 20:00 Concert | Her phone buzzes: "Sounds like a show. Open the camera?" | Moment mode. She films three short bursts and taps "mark" at her favorite song. | She watches most of the show instead of filming it |
| 22:30 Leaving | Walks to the train | Builds three reel options with the Concert template, beat-matched cuts and captions | Picks one and posts it on the way home |
| 22:45 Recap | Opens the evening notification | Two promises, one decision, four things to remember, the reel and one fun line | Feels caught up; taps an item to hear the original |
| Next day 09:00 | — | Morning nudge for anything due | The vendor gets the specs on time |
| Sunday | — | Weekly recap and a 30-second trailer of her week | Something to look back on and share |

### Why she comes back

The evening recap is the habit. A small reward each day keeps her opening it, and each small correction she makes improves the next recap, so the app gets more useful the longer she uses it.

The daily habit loop, four steps around all-day capture:

1. **Capture** runs all day with no effort.
2. **Recap** arrives in the evening.
3. **Correct** with one tap: right, wrong or not important.
4. **Better recap** the next day, ranked by what she actually cares about.

The correction step matters most. It is cheap for the user (one tap) and it is the only way the app learns which items she actually cares about.

## How each part works

The design principle is "keep little, return a lot": store the least raw data that still produces a useful, checkable recap.

### 1. Capturing the day

**Starting** takes one tap from the Lock Screen widget, Action Button or Watch. The app also suggests starting when a calendar event begins or when the user leaves home.

**Stopping** happens on a tap, on entering a pause zone, when battery drops below a set level, or when the user says a phrase such as "off the record" (an idea to test for accuracy). A private-mode tap pauses for 30 minutes.

**What is kept:**

| Data | Kept for | Why |
| --- | --- | --- |
| Silence and background noise | Never stored | Saves battery and storage, and lowers privacy risk |
| Raw audio of speech | 7 days by default (user picks 1 to 30) | Lets the user replay a moment to check it |
| Transcripts, summaries and items | Until the user deletes them | This is the memory that search and recaps use |
| Video | Only what the user films in Moment mode, until the reel is made or 7 days pass | Video is large and the most sensitive |

### 2. Understanding what happened

The app splits the day into **moments** at pauses, place changes and speaker changes. Each moment gets a type (meeting, social, call, commute, show, solo), the people involved (once the user names a voice), the place, a topic and these extracted items:

- **Promises,** in both directions: "you promised" and "promised to you," each with who, what and when. "I'll send it Thursday" becomes a dated item.
- **Decisions** made.
- **Things to remember:** names, numbers, dates, places and recommendations.
- **Open questions** nobody answered.

Items below a confidence threshold are marked with a question mark and are never pushed as reminders.

### 3. The evening recap

The recap is ordered by value, not by time:

1. Promises, by you and to you, with dates
2. Decisions
3. Things to remember
4. Open questions
5. Today's reel or highlight
6. One fun line, such as an award or a stat

Rules for the recap:

- Readable in about a minute, so at most about 10 items.
- Every item links to its moment, so the user can read or hear the original.
- On a quiet day it says so, instead of padding.
- It leaves arguments and emotional moments out by default. Research on memory finds that practicing recall strengthens memories and links repeated recall of negative experiences to rumination, so the app should not replay conflicts nightly unless asked.
- Each item has three buttons: right, wrong and not important. These train the ranking for that user.
- A morning nudge repeats anything due that day.

### 4. Ask your day

A search box that answers plain questions from the transcripts, such as "what time did the plumber say?", "everything Alex said about the budget this week" or "the restaurant Jenny recommended". Answers quote the moment, play the audio and can be filtered by person, place or date.

### 5. Making the clip

This follows the pattern behind TikTok's and CapCut's auto-editing: the person picks the moment, and templates supply the polish.

1. **Detect a show** from music and crowd sound, plus a calendar entry or venue location.
2. **Prompt** "Sounds like a show. Open the camera?"
3. **Film short bursts** and tap "mark" at the best moments. The goal is to film less and watch more.
4. **Pick a template** after the show: Concert, Night out, Trip or Food. Each sets the cut pace, caption style, transitions and color.
5. **The app builds three options:** a montage of the marked shots with cuts on the music's beat, a vertical crop that follows the performer, captions for any speech, and a suggested title.
6. **Choose, trim and export** to the camera roll or the share sheet. Before export it warns that concert music may be muted on social platforms and offers a version with the user's voice plus a royalty-free track.

### 6. Privacy controls

- A **privacy center** shows exactly what is stored and for how long.
- **Forget a person** removes everything a named person said, for example when a friend asks.
- Delete any moment, export everything, and set auto-delete timers.
- Mood and "people insights" are off by default.
- A plain promise: user data is never used to train models.

## Screens

Seven screens cover the whole product. The first two are where the daily value happens.

| Screen | What is on it | Why it matters |
| --- | --- | --- |
| **Today** (home) | A large capture button, a clear status (recording, paused or private), and today's moments so far | One tap to start, and it is always obvious whether the app is listening |
| **Recap** | The evening list, the reel and the fun line | The daily value moment |
| **Timeline** | The day as cards; tap one to read or hear it | Checking the source is what builds trust |
| **Moment** | Transcript, speakers, items, audio playback and label fixes | Where corrections happen |
| **Clips** | Reels, day and week trailers, templates and export | The sharing and growth loop |
| **Ask** | Plain questions across all your days | Lets the user pull answers instead of waiting for pushes |
| **Privacy** | What is stored, timers, pause zones, export and forget a person | Makes trust visible instead of burying it in settings |

## Value delivered and what people would pay

The app should be priced like the meeting tools people already pay for, about $8 to $10 a month on annual billing, but it needs no hardware. Its value is easiest to prove through promises caught and minutes not spent taking notes.

### What users get, and how we would measure it

| Value | For whom | How to measure it |
| --- | --- | --- |
| Promises kept | Juggler, overloaded mind | Promises detected, and the share marked done by their due date |
| Present in conversations | Juggler, overloaded mind | Minutes of meetings with no manual notes, and a self-rated "I could focus" score |
| Answers on demand | Overloaded mind | Ask-your-day questions answered correctly |
| Present at shows, with a clip anyway | Experience collector | Minutes filmed per show (want lower) and reels saved or shared |
| A record worth looking back at | Everyone | Weekly recap and trailer opens |

### Price anchors in the market

| Product | Price |
| --- | --- |
| Otter Pro | $8.33 a month billed yearly, or $16.99 monthly |
| Fireflies Pro | $10 a month, billed yearly |
| Plaud Pro | $99.99 a year or $17.99 a month, on top of a device |
| Plaud Unlimited | $239.99 a year |
| Plaud NotePin S with a Pro year | $278.99 in the first year |

### Proposed plans (to test, not final)

- **Free:** Day mode, the evening recap, 7 days of history and 3 reels a week. Enough to form the habit.
- **Plus, test $7.99 to $9.99 a month or $79 to $99 a year:** unlimited history, Meeting mode with exports, Ask your day, all clip templates and the weekly trailer.

With no device to buy, a first year of Plus would cost roughly a third of Plaud's device plus Pro bundle.

**A cost warning.** The main doc estimates $4 to $10 a month of server cost for a heavy user. At $8 a month that leaves little or no margin for heavy users. So the free tier must limit cloud labeling, Plus must use a cheaper model for routine moments, and Phase 0 must measure what a typical user actually costs.

## Why people would switch

No single competitor covers the whole day, video and clips, and every one of them asks the user to do something extra: buy a device, invite a bot, or edit footage.

| If they use today | What they get there | What this app adds |
| --- | --- | --- |
| Bee | A cheap always-listening device and a daily diary | No extra device, video moments and reels, and promises that link to their source |
| Plaud | Strong meeting audio and templates | No device to buy or charge, the whole day rather than only what was recorded, and reels |
| Otter, Granola, Fireflies | Meeting notes | In-person life beyond meetings, with no bot joining |
| CapCut, OpusClip | Polished editing | It already knows what happened, so there is no editing session |
| 1 Second Everyday | A lovely daily-video habit | The same habit done for you, plus what was said |
| The phone's voice recorder | Free recording | Transcribed, summarized and searchable |

The one-line pitch: **your phone remembers your day and hands back what matters, your promises, your notes and your best moment.**

## What would kill the value

The value is fragile in six places. Each has an early warning sign and a guard built into the design above.

| Value killer | Early sign | Guard |
| --- | --- | --- |
| Recaps feel generic or wrong | Recap opens fall after the first week | Fewer items, source links on every item, and ranking trained by right, wrong and not-important taps |
| Too much to review | Recaps take more than a minute to read | A hard cap of about 10 items, ranked by value |
| Social pushback | Users stop recording at home or with friends | Pause zones, private mode, the "off the record" phrase and a visible indicator |
| Battery drain | Day mode is off by mid-afternoon | Skipping silence, a low-power speech model and a battery guard |
| Insights feel creepy | Users switch off people or mood features | Those features off by default, and no replaying of conflicts |
| A trust shock, such as a policy change or acquisition | Spikes in exports and deletions | Local-first storage, export at any time, and a public promise that data stays portable |

## Proving the value before building it

Three cheap tests can show whether people want the recap and the reel before the team writes capture code. They run alongside Phase 0 in the main plan.

1. **Concierge recap, 2 weeks, 10 to 15 people** from the juggler and overloaded-mind groups. They record with their phone's built-in voice recorder and upload each evening. You produce the recap by hand or with a simple script and a language model, following the recap rules above. Measure opens, items marked useful, and whether they would pay.
2. **Hand-made reels, 5 people** who are going to a show. They film their usual way, plus a version where they only film short bursts. You build reels with the template rules. Measure which reel they share and how much of the show they say they watched.
3. **Landing page with two headlines,** one about never dropping a promise and one about being present at shows. Measure sign-ups for each.

**Proposed bar to continue,** linked to Gates A and B in the main plan:

- Half of concierge users open the recap at least 5 days a week.
- Each user reports at least one "I had forgotten that" item per week.
- At least a third of test reels get shared.

## Check against the original brief

This design still delivers everything in your original brief. Video is limited to moments by what phones allow, and "fun" still needs proof from users.

| Original ask | Where it shows up here | Status |
| --- | --- | --- |
| Turn on camera or mic and keep recording | Day mode for audio, Moment mode for video | Audio all day. Video only in moments, because phones block background camera use. |
| Transcribe or identify what happened | Moments with type, people, place and extracted items | Met |
| Summarize at the end of the day | The evening recap, ranked by value with source links | Met |
| Meeting becomes a transcript summary | Meeting mode | Met |
| A show becomes a TikTok clip | Show prompt, mark-a-moment, templates and beat-matched montage | Met when the user films a few bursts |
| Useful and fun | Promises and Ask your day (useful); reels, trailers and awards (fun) | Designed, not yet proven. The tests above check it. |

## Sources

- [Vanderbilt: note-taking and memory for conversation](https://news.vanderbilt.edu/2023/04/28/brown-schmidts-study-shows-benefits-limits-of-contemporaneous-notetaking-on-memory-for-conversation/)
- [Illinois Neuroscience: memcons study (4.7% joint recall)](https://neuroscience.illinois.edu/spotlight/publication/memcons-how-contemporaneous-note-taking-shapes-memory-conversation)
- [Guitar.com: UK gig-goer phone survey](https://guitar.com/news/music-news/should-phones-be-banned-at-oasis-live-25/)
- [We Rave You: Heineken filming survey](https://weraveyou.com/2024/10/new-survey-from-heineken-shows-that-more-people-prioritize-filming-at-concerts-than-being-in-the-moment/)
- [Big Guy on Stuff: Bee, Plaud and Limitless review](https://bigguyonstuff.com/ai-wearables-2026-honest-review/)
- [Eka VC: ten days with an AI wearable](https://ekavc.substack.com/p/living-on-record-my-first-ten-days)
- [AOL / NBC News: wearing several AI devices](https://www.aol.com/news/wore-bunch-ai-devices-once-193655577.html)
- [Plaud: voice recorder for ADHD](https://www.plaud.ai/blogs/articles/voice-recorder-and-second-brain-for-people-with-adhd)
- [CHADD Attention: AI and ADHD](https://chadd.org/wp-content/uploads/2024/12/ATTN_12_2024-Harnessing-Artificial-Intelligence-to-Live-Better-with-ADHD.pdf)
- [Hertel et al.: rumination and retrieval practice](https://works.bepress.com/paula_hertel/140/)
- [Sacra: Plaud business model and competitor prices](https://sacra.com/c/plaud)
- [Omi: Plaud pricing and bundles](https://www.omi.me/blogs/ai-note-takers/plaud-pricing)
- [DIY AI: Otter.ai pricing 2026](https://diyai.io/ai-tools/speech-to-text/otter-ai-pricing/)
- [TikTok Newsroom: Smart Split](https://newsroom.tiktok.com/new-ai-powered-tools-to-make-it-easier-to-create-and-share-on-tiktok)
- [CapCut: Auto Cut](https://www.capcut.com/help/auto-cut-in-capcut)
