# Fuente de los mockups

`disparador.html` es el mockup de FindTek Disparador escrito como HTML real. El PNG del
README se genera desde acá, así que la imagen es reproducible y editable — no un export
suelto de una herramienta de diseño.

## Regenerar el PNG

```bash
# 1. Traer Inter (no se versiona: son ~400 KB que no aportan al repo)
for w in 400 500 600 700; do
  curl -sL "https://cdn.jsdelivr.net/npm/@fontsource/inter/files/inter-latin-$w-normal.woff2" \
    -o "inter-$w.woff2"
done

# 2. Renderizar a 2x
chromium --headless --disable-gpu --no-sandbox --hide-scrollbars \
  --force-device-scale-factor=2 --screenshot=../mockup-disparador.png \
  --window-size=1200,600 "file://$PWD/disparador.html"
```

El alto final (600 px CSS) sale de medir dónde termina el contenido y recortar el resto,
no de un número elegido a ojo.

> Los otros dos mockups (`mockup-gastro.png`, `mockup-gestion.png`) se hicieron en Figma
> y **no tienen fuente acá**. Al rehacerlos, conviene pasarlos también a HTML.
