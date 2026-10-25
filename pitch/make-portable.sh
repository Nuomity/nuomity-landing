#!/bin/sh
# Rebuilds Nuomity-pitch-portable.zip (double-click, offline version for another PC).
set -e
cd "$(dirname "$0")"
python3 scripts-make-notes.py
rm -rf build Nuomity-pitch-portable.zip
mkdir -p "build/Nuomity pitch/composition"
cp "Open presentation.html" "Speaker notes.html" "HOW TO PRESENT.txt" "build/Nuomity pitch/"
cp -R composition/index.html composition/assets composition/fonts composition/vendor "build/Nuomity pitch/composition/"
(cd build && zip -qr ../Nuomity-pitch-portable.zip "Nuomity pitch")
echo "Built Nuomity-pitch-portable.zip"

# Web version for the landing-page host: upload the "pitch" folder to the site root → /pitch/
# (no speaker notes: they are internal; noindex so search engines skip it)
rm -rf build-web Nuomity-pitch-web.zip
mkdir -p build-web/pitch/composition
cp -R composition/index.html composition/assets composition/fonts composition/vendor build-web/pitch/composition/
sed -i '' 's#<meta charset="UTF-8" />#<meta charset="UTF-8" />\n    <meta name="robots" content="noindex, nofollow" />#' build-web/pitch/composition/index.html
cat > build-web/pitch/index.html <<'HTML'
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="robots" content="noindex, nofollow" />
    <title>Nuomity · pitch</title>
    <meta http-equiv="refresh" content="0; url=composition/index.html#present" />
    <style>body { margin: 0; height: 100vh; display: grid; place-items: center; background: #011a33; color: #dfe7f4; font: 500 20px system-ui, sans-serif; } a { color: #e4ee5c; }</style>
  </head>
  <body><a href="composition/index.html#present">Open the Nuomity presentation</a></body>
</html>
HTML
(cd build-web && zip -qr ../Nuomity-pitch-web.zip pitch)
echo "Built Nuomity-pitch-web.zip"
