# Nuomity — svetainė (GitHub Pages)

Statinė svetainė su „švariais" URL (be `.html` adreso juostoje).

## Struktūra

```
/
├── index.html                     →  /                       (pradžia / landing)
├── privatumo-politika/index.html  →  /privatumo-politika/     (privatumo politika)
├── apklausa/index.html            →  /apklausa/               (nuomotojų apklausa)
├── nuomity.css                    (bendri stiliai)
├── og-image.png                   (socialinių tinklų peržiūros paveikslėlis, 1200×630)
├── logos/                         (partnerių logotipai, ikona)
├── team/                          (komandos nuotraukos)
└── .nojekyll                      (išjungia Jekyll apdorojimą)
```

Švarūs URL veikia todėl, kad kiekvienas puslapis yra `index.html` savo kataloge — GitHub Pages automatiškai atiduoda `/privatumo-politika/` → `/privatumo-politika/index.html`.

## Įdiegimas

1. Įkelk **visą `github-pages/` katalogo turinį** į repozitorijos šakninį lygį (arba nurodyk šį katalogą Pages nustatymuose).
2. Repo → **Settings → Pages** → Source: `Deploy from a branch` → šaka `main`, katalogas `/ (root)`.
3. Custom domenui (nuomity.lt): Settings → Pages → Custom domain → `nuomity.lt` (sukurs `CNAME` failą). DNS: `A`/`CNAME` įrašai į GitHub Pages.

## Nuorodos
Visos vidinės nuorodos jau atnaujintos švariam formatui:
- Landing → `privatumo-politika/`
- Privatumo politika → `../#kaip-veikia`, `../nuomity.css` ir t. t.

## Backend (laukiančiųjų sąrašas)
Formos ir laukiančiųjų skaitiklis kreipiasi į Cloudflare Worker
(`https://nuomity-waitlist.dmitrijus.workers.dev/`). Skaitiklio juosta pasirodo,
kai `/count` grąžina ≥ 15 registracijų iš leidžiamo domeno.
