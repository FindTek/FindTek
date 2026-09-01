#!/usr/bin/env bash
# Renderiza los mockups del README desde su fuente HTML.
# Uso: ./render.sh            (todos)
#      ./render.sh gastro     (uno)
set -euo pipefail
cd "$(dirname "$0")"

# Inter no se versiona: son ~400 KB que no aportan al repo.
for w in 400 500 600 700; do
  [ -f "inter-$w.woff2" ] || curl -sL \
    "https://cdn.jsdelivr.net/npm/@fontsource/inter/files/inter-latin-$w-normal.woff2" \
    -o "inter-$w.woff2"
done

CHROME=${CHROME:-$(command -v chromium || command -v google-chrome)}
[ -n "$CHROME" ] || { echo "Falta chromium. apt install chromium-browser"; exit 1; }

for n in "${@:-gastro gestion disparador gimnasio}"; do
  "$CHROME" --headless --disable-gpu --no-sandbox --hide-scrollbars \
    --force-device-scale-factor=2 --screenshot="raw-$n.png" \
    --window-size=1280,1000 "file://$PWD/$n.html" 2>/dev/null
  python3 recortar.py "raw-$n.png" "../mockup-$n.png"
  rm -f "raw-$n.png"
  echo "  ../mockup-$n.png"
done
