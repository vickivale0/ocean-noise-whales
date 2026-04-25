# Deploy Guide

Five ways to publish *The Loudening*, from "easiest, no account" to "your own domain."

Pick one. They all work. The site is fully static — no server, no database, no build step.

---

## Step 0 — Set the canonical domain

Before deploying, decide on a URL and run:

```bash
bash set-domain.sh your-domain.com
```

Examples:
```bash
bash set-domain.sh tippingpoint.media
bash set-domain.sh tippingpoint.io
bash set-domain.sh loudening.pirix.media
bash set-domain.sh chioztabak.github.io/the-loudening
```

This replaces all `REPLACE-WITH-YOUR-DOMAIN` placeholders in `index.html` with your real domain — used by Open Graph, Twitter Card, and Schema.org metadata.

**Don't skip this.** Without it, when someone shares your link on Twitter/LinkedIn/WhatsApp, the preview card image won't load.

You can change it later. If you start with `username.github.io/the-loudening` and later move to `tippingpoint.media`, just re-run the script with the new domain.

---

## Option 1 — Netlify (easiest, no terminal)

**Best for:** "I just want it online in 60 seconds."

1. Go to [app.netlify.com/drop](https://app.netlify.com/drop)
2. Drag the entire `loudening-final` folder onto the page
3. Done. You get a URL like `https://gentle-whale-a3f9b2.netlify.app`
4. Optionally rename it: Site settings → Change site name → `the-loudening`
5. Optionally connect your own domain: Domain settings → Add custom domain

**Pros:** Zero setup, automatic HTTPS, free.
**Cons:** Free tier is plenty here, but you don't get version history without a Git repo.

---

## Option 2 — GitHub Pages (free, integrated with version control)

**Best for:** "I want to track changes and have a real repo."

### One-time setup
1. Create a GitHub account if you don't have one
2. Install GitHub Desktop ([desktop.github.com](https://desktop.github.com)) — easier than terminal

### Publishing
1. Open GitHub Desktop → File → New repository → name it `the-loudening` → save it somewhere on your computer
2. Move all files from `loudening-final/` into that repository folder
3. In GitHub Desktop: write a commit message ("Initial publish") → Commit to main → Publish repository
4. Make it **public** (uncheck "keep private") — GitHub Pages requires public repos on free accounts
5. Go to your repo on github.com → Settings → Pages
6. Under "Source," choose `Deploy from a branch` → Branch: `main` → Folder: `/ (root)` → Save
7. Wait 30 seconds, refresh. URL appears: `https://YOUR-USERNAME.github.io/the-loudening/`

### Updating later
Edit files locally → GitHub Desktop → Commit → Push. Site updates in a minute.

**Pros:** Free, version history, professional URL.
**Cons:** First setup takes 10 minutes.

---

## Option 3 — Vercel (modern, fastest CDN)

**Best for:** "I might add more dispatches later and want this to scale."

1. Sign up at [vercel.com](https://vercel.com) with your GitHub account
2. Connect the GitHub repo (from Option 2)
3. Click "Deploy" — that's it. No build settings to configure.
4. Vercel gives you a URL like `the-loudening.vercel.app`
5. Custom domain: Project → Settings → Domains → Add → enter `tippingpoint.media`

**Pros:** Fastest CDN globally, automatic preview deploys for branches, free.
**Cons:** Slight learning curve if you've never used it.

---

## Option 4 — Your own domain (Pirix, Tipping Point)

**Best for:** "I have `tippingpoint.media` or `pirix.media` and want this to be `tippingpoint.media/the-loudening` or a subdomain."

You still need a host (Netlify, Vercel, GitHub Pages — pick from above). Then:

### Subdirectory: `tippingpoint.media/the-loudening`
- If your main site is also on Netlify/Vercel: deploy this in a subfolder of that site, OR use a redirect/proxy rule (see your host's docs)
- Easiest if you don't already have a main site: put `the-loudening` content directly at the root of `tippingpoint.media`

### Subdomain: `loudening.tippingpoint.media`
1. In your domain registrar (GoDaddy, Namecheap, Cloudflare, etc.), add a CNAME record:
   - Name: `loudening`
   - Value: `your-netlify-site.netlify.app` (or your Vercel/GitHub Pages URL)
2. In your host (Netlify/Vercel/GitHub), add the custom domain `loudening.tippingpoint.media`
3. HTTPS provisions automatically (Let's Encrypt) within minutes

After DNS propagates (~5 min to 24 hours), your site is live at the custom URL.

---

## Option 5 — Just open the file (no publishing yet)

**Best for:** "I'm still iterating, not ready to share."

Double-click `index.html` and it opens in your browser. Works offline, no internet needed once fonts are cached.

**Caveat:** The Web Audio context might require a click before playing (browser autoplay policies) — already handled in the code.

---

## After deploying — checklist

- [ ] Open the live URL on a phone — verify the dark theme looks right and audio plays
- [ ] Test all 4 species in section 02 — circles should resize
- [ ] Test all 5 codas in section 04 (the Archive) — clicks should fire as dots, audio should play
- [ ] Paste your live URL into Twitter compose — verify the OG card shows up correctly
- [ ] Paste into LinkedIn — same
- [ ] Paste into WhatsApp — same
- [ ] Paste into Slack — same
- [ ] Run [opengraph.xyz](https://www.opengraph.xyz/) on your URL to verify the preview card
- [ ] Run [twitter.com/validator](https://cards-dev.twitter.com/validator) (Twitter Card validator)

If the OG image doesn't show, the most common issue is the canonical URL — re-run `set-domain.sh` and re-deploy.

---

## File structure (for reference)

```
loudening-final/
├── index.html          ← The page itself
├── og-card.png         ← Social media preview image (1200×630)
├── og-card.svg         ← Editable source for the OG card
├── favicon.svg         ← Browser tab icon
├── set-domain.sh       ← Run this once before deploying
├── DEPLOY.md           ← This file
├── README.md           ← Project overview & credits
└── audio/
    ├── 10.wav          ← The 1+1+3 coda (used in Listen section)
    ├── 1000.wav
    ├── 1004.wav
    ├── 1017.wav
    └── 1018.wav
```

Total size: ~1.7 MB. Faster than 90% of news websites.
