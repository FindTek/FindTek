# Fuente de los mockups

Los cuatro mockups del README **son HTML real**, no exports de una herramienta de
diseño. El PNG se genera desde acá, así que son reproducibles y editables por
cualquiera que sepa CSS.

```bash
./render.sh              # los cuatro
./render.sh gimnasio     # uno solo
```

| Archivo | Pantalla |
|---|---|
| `gastro.html` | POS de salón, mesa abierta con facturación SIFEN |
| `gestion.html` | Panel de sprint: horas, tareas, finanzas y equipo |
| `disparador.html` | Un asset derivado a siete redes |
| `gimnasio.html` | Cobranza con estados de cuota |

## Cómo está armado

`chrome.css` tiene la base compartida — ventana, sidebar, tarjetas, pills, botones —
con los colores en variables. Cada pantalla sobrescribe solo lo suyo.

**Cada mockup usa la identidad de SU producto.** Los tres de FindTek van con el coral
`#E8645C`; `gimnasio.html` va con la paleta **«Oro y Ceniza»** del sistema de
gimnasios, tomada de su `docs/identidad-visual.md`: amarillo `#FACC15` solo como
acción, semáforo para estado, y la tarjeta negra como firma visual.

## Detalles que importan al editarlos

- **El alto no se elige a ojo.** `recortar.py` mide por luminancia dónde termina la
  ventana y corta ahí. El fondo tiene degradado, así que comparar contra un color
  plano no sirve.
- **Las barras del gráfico necesitan alto definido** en su contenedor: sin
  `height:100%` en `.b`, el `height:%` de cada barra resuelve a 0 y el gráfico sale
  vacío. Pasó.
- **Inter se baja al renderizar** y está en `.gitignore`. Sin ella el render cae al
  stack del sistema y se ve distinto.
