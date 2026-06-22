# Nuomity — landing page

Statinis landing puslapis. Tinka GitHub Pages, Netlify, Vercel ar bet kuriam statiniam hostingui.

## Failai

```
index.html      ← pagrindinis puslapis
nuomity.css     ← stiliai
logos/          ← partnerių ir Nuomity logotipai
team/           ← komandos nuotraukos
.nojekyll       ← liepia GitHub Pages nepraleisti failų per Jekyll
```

## Paleidimas lokaliai

Atidaryk `index.html` naršyklėje. (Nuotraukoms/CSS reikia, kad failai būtų tame pačiame aplanke.)

## Publikavimas per GitHub Pages

1. Sukurk repozitoriją ir įkelk visus šio aplanko failus į šaknį.
2. Repo → **Settings → Pages**.
3. **Source**: `Deploy from a branch`, šaka `main`, aplankas `/ (root)`.
4. Po kelių minučių puslapis bus adresu `https://<vartotojas>.github.io/<repo>/`.

## ⚠️ Būtina: prijunk waitlist formą

Puslapyje yra dvi el. pašto rinkimo formos. GitHub Pages serverio neturi, todėl
formos siunčia duomenis per **Formspree** (nemokamas planas tinka pradžiai).

1. Susikurk formą [formspree.io](https://formspree.io).
2. Gausi endpoint, pvz. `https://formspree.io/f/abcdwxyz`.
3. `index.html` faile susirask eilutę:
   ```js
   var FORMSPREE_ID = 'YOUR_FORM_ID';
   ```
4. Įrašyk savo ID (vien tik `abcdwxyz` dalį) vietoj `YOUR_FORM_ID`.

Kol to nepadarysi, formos rodys klaidą ir el. paštų nerinks.

> Alternatyvos: [Tally](https://tally.so), [Google Forms](https://forms.google.com) —
> tuomet formą reiktų pakeisti embed'u arba nuoroda.

## Custom domenas (nebūtina)

Settings → Pages → Custom domain. Pridėk `CNAME` failą su domenu ir sukonfigūruok DNS.
