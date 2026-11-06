# Running the app on an iPhone

The app runs on an iPhone from a Mac. Today it shows the same screens as the web preview, natively, with
the real encrypted database and the database key in the Keychain. Recording is still simulated: the real
microphone, background recording and the Lock Screen come with the Swift capture engine (spec §6, spike S1).

## One-time setup on the Mac

| Step | How |
| --- | --- |
| Xcode | From the App Store. Open it once and accept the license; install the iOS platform it offers. |
| Command line tools | `xcode-select --install`, then `sudo xcodebuild -runFirstLaunch` |
| CocoaPods | `brew install cocoapods` |
| Flutter 3.47.8 | The version in `.fvmrc`: `brew install fvm`, then `fvm install` in the repo root and use `fvm flutter`; or install Flutter 3.47.8 by hand |
| Deno 2 | `brew install deno` (only for the analysis server) |
| The code | `git clone https://github.com/yongtao-wang/mona.git`, then `git checkout claude/optimistic-curie-6c8gpr` (or `git pull` if you already have it) |

## One-time setup on the iPhone

1. Plug the iPhone into the Mac with a cable and tap **Trust** on the phone.
2. Turn on **Settings → Privacy & Security → Developer Mode** and restart the phone when asked. The
   option appears after the phone has been connected to Xcode once.

## Signing (one time)

1. Open `app/ios/Runner.xcworkspace` in Xcode.
2. Select **Runner** → **Signing & Capabilities** → **Team**, and pick your Apple ID (Xcode → Settings →
   Accounts adds one). A free Apple ID works; its builds expire after 7 days, then you run again.
3. If Xcode says the bundle identifier `app.mona.mona` is not available, change it to something unique,
   such as `com.<your-name>.mona`.

## Run

```sh
cd mona/app
fvm flutter pub get           # or: flutter pub get
fvm flutter run               # pick the iPhone when asked
```

The first build takes several minutes. The first launch on the phone may say the developer is not
trusted: **Settings → General → VPN & Device Management** → your Apple ID → **Trust**.

## With analysis (optional)

Run the gateway on the Mac and point the app at it. The phone and the Mac must be on the same Wi-Fi.

```sh
# Terminal 1: the gateway with the stand-in model (add ANTHROPIC_API_KEY=... for Claude)
cd mona/backend/supabase && deno task dev

# Terminal 2: the Mac's Wi-Fi address, then the app
ipconfig getifaddr en0
cd mona/app && fvm flutter run \
  --dart-define=GATEWAY_URL=http://<that address>:8787/gateway \
  --dart-define=DEV_TOKEN=dev
```

Allow **Local Network** when the phone asks. If the Mac's firewall asks about `deno`, allow it.

## What to try

| Check | Where |
| --- | --- |
| Today shows the sample day, in English (or Chinese if the phone is set to Chinese) | Today |
| The record button starts and stops; the pill shows Recording, Paused or Private | Bottom bar; tap the pill |
| The pill stays visible on every screen while recording | Me, Privacy center |
| Text grows with **Settings → Accessibility → Display & Text Size → Larger Text** | All screens |
| VoiceOver reads the pill state and each tile as time + title | Triple-click the side button if set up |
| Data survives a restart: close the app fully, open it again | Today |
| With analysis: a new meeting tile with items appears | Me → Debug flags → Analyze a sample meeting |

## If something fails

Send the error text from the terminal (or Xcode's issue navigator) back to the session. If you add the
`mona` folder to the Claude desktop app's Remote Control list (Settings → Claude Code → Remote Control),
the agent can run the build on the Mac and read the errors itself.
