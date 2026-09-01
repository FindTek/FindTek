"""Recorta un render al contenido real. El fondo puede tener degradado, así que
mide luminancia: la ventana de la app es mucho más clara que el backdrop."""
import sys
from PIL import Image
ruta, salida = sys.argv[1], sys.argv[2]
margen = int(sys.argv[3]) if len(sys.argv) > 3 else 68
im = Image.open(ruta).convert("RGB"); W, H = im.size; px = im.load()
ult = 0
for y in range(H):
    if any(sum(px[x, y]) / 3 > 55 for x in range(0, W, 5)):
        ult = y
corte = min(H, ult + margen)
im.crop((0, 0, W, corte)).save(salida, optimize=True)
print(f"  contenido hasta y={ult} → {W}x{corte}  ({W/corte:.2f}:1)")
