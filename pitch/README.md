# Nuomity · ROCKIT Progress Days pitch

9-slide HyperFrames slideshow (1920×1080), 22 build steps: Hook, Product demo, AI vision, Market & model, Competition, Early traction, Team, Ask, Closing. Slide copy is the founders' text word for word; speaker notes are talking points.

## Present

```bash
npm run dev
```

Opens presenter mode (`hyperframes present ./composition`) at http://localhost:3004.

1. The presenter tab shows the current slide, the next slide, notes and a timer.
2. Press **P** (or the Present icon) to open the **audience** tab. Drag it to the projector and press **F** for fullscreen.
3. **→ / Space** = next build. **← / Backspace** jumps to the start of the previous slide (HyperFrames presenter behaviour). The double-click version below steps back one build at a time.

- Google Meet: Share screen → **A tab** → pick the audience tab.
- Zoom: drag the audience tab into its own window and share that window.
- After editing the slideshow island (notes, fragments) restart `npm run dev`: the presenter reads it at start-up.

## On another PC (USB, nothing to install)

`Nuomity-pitch-portable.zip` (≈5 MB) holds a `Nuomity pitch` folder. Copy it to the PC, unzip, double-click **Open presentation.html** (Chrome or Edge), press **F**. Next: → / Space / Enter / PageDown / click (clickers work). Back: ← / Backspace / PageUp. No presenter view in this mode: use `Speaker notes.html` (printable).

Rebuild after edits: `./make-portable.sh`. It also builds `Nuomity-pitch-web.zip` (a `pitch` folder for the website, without speaker notes). Both zips and the `build*/` folders are generated, so they are not in git.

## Offline

The deck needs no internet. Everything it loads is in the project:

- `composition/vendor/`: GSAP 3.14.2 and the HyperFrames runtime 0.8.166
- `vendor/`: player + slideshow bundles for the direct-open `index.html`
- `node_modules/`: the `hyperframes` CLI (0.8.166), so `npm run dev` doesn't call npm

On a new laptop, run `npm install` once **while online**. After that it works without a connection. Verified with every non-localhost request blocked: 0 outside requests, all 22 builds play.

## Files

- `composition/index.html`: the deck (scenes, island + notes, GSAP builds). Edit copy here.
- `index.html`: direct-open wrapper (`npm run serve`, then http://localhost:8765). Its island copy must match the composition's.
- `composition/assets/`: official white Nuomity logo + icon, founder photos, company logos, the slide 2 video and its still; `composition/fonts/`: Poppins + JetBrains Mono (OFL).
- `scripts-make-notes.py`: builds `Speaker notes.html` from the notes in the island (run by `make-portable.sh`).
- `preview-slides/`: a PNG of every slide at its last build, plus a contact sheet.
- Logo: only the official white logo, never recoloured, always on navy. Slides 1–2 (and the video) show it as a tab hanging from the top-left edge, slides 4–8 as the same tab top right, slide 3 plain inside the navy panel, slide 9 large in the centre.

## Set up after cloning

```bash
npm install
npm run dev
```

The slide 2 video's source is a separate HyperFrames project (`~/motion-studio/nuomity-journey-phone`); only its rendered mp4 is in this repo.

## Before the event

- Slide 2 plays `composition/assets/nuomity-journey-17s.mp4` (21 s, copied from `~/motion-studio/nuomity-journey-phone/renders/nuomity-journey-phone.mp4`; re-copy after each re-render). Its first frame is slide 1's last frame, so the cut is invisible: if slide 1 changes, update the video too. It plays from the start each time the slide opens and rewinds when you leave; it only plays while presenting (presenter, double-click, web), and Studio and renders show its still (`…-poster.jpg`). Encode it full-range with sRGB tags so its navy matches slide 1 (`ffmpeg -framerate 60 -i frames/frame_%06d.png -vf "scale=out_color_matrix=bt709:out_range=full,format=yuv420p" -c:v libx264 -crf 14 -x264-params "fullrange=on:colorprim=bt709:transfer=iec61966-2-1:colormatrix=bt709" -color_range pc -color_trc iec61966-2-1 …`, frames from `hyperframes render --format png-sequence`); the default encode comes out 3 steps bluer-darker. To swap the video, replace the mp4 and re-grab the still with `ffmpeg -ss 0 -i <video> -frames:v 1 -q:v 3 composition/assets/nuomity-journey-17s-poster.jpg`.
- Slide 6 shows 20+ on the waitlist and 5 landlord deep dives (confirmed 2026-10-21).
- Prices on slide 4 (market & model: €14.90 per screening check, €10 a month flat for rental management, ≈ €135 per rental a year with one screening check; 34,888 target landlords with a business certificate (VMI 2025) ≈ €4.7M a year) are labelled *Planned pricing*; slide 3's assistant screen is labelled *Future product vision*.
- Clickers that send PageDown/PageUp won't advance the deck; use one with an arrow-key mode, or the keyboard.
