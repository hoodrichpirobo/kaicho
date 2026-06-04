# 06 · FIN DE SESIÓN — Log, marcador y recalibración automática

> Gatillo: **`fin`** ("fin de sesión", "cerrar", "fin del round"). Se ejecuta al terminar cada `sesion`.
> Aquí el trabajo del día se vuelve **datos** (para calibrar), **dopamina** (para volver mañana) y un
> **veredicto honesto**. Es deliberadamente mecánico: lee, registra, compara, dictamina. Pensado para
> ejecutarse a diario incluso en un modelo menos potente.

---

## PASOS DEL `fin` (en orden, sin saltarte ninguno)

### 1. Cierra el crono
Para el cronómetro. Calcula **horas reales** = tiempo activo − pausas.

### 2. Escribe el log fechado (un fichero por sesión)
En `cuatrimestres/<cuatri>/asignaturas/<ASIG>/LOGS/AAAA-MM-DD_<ASIG>[_n].md` (`_n` si hay >1 ese día):

```markdown
# Log · <ASIG> · <AAAA-MM-DD>
- **Round nº:** <n>   ·   **Horas reales:** <h:mm> (sin pausas)
- **Tipo:** examen en frío | ejercicios tipo | recall espaciado | mixta

## Qué se hizo (activo)
- <tarea> — <tiempo> — resultado

## Accuracy en ejercicios tipo
| Tipo | Intentados | Correctos sin pista | % |
|---|---|---|---|

## Recall espaciado
- Cerrados (acertados en frío): <...> → +XP   ·   Aún débiles: <...>

## Psicología observada (para perfil/PSICOLOGIA.md)
- ¿Evitación? ¿Qué la disparó/rompió? ¿A qué hora rindió?

## Próximo paso (UNO solo)
- <la única acción para mañana>
```
> **Append-only:** no reescribas logs viejos. Un fichero nuevo por sesión.

### 3. Marca el `ROADMAP.md`
En la fila de HOY del `cuatrimestres/<cuatri>/ROADMAP.md`: `[x]` si se cumplió, `[!]` si NO (quedó a
medias o no se hizo). Tacha los checkpoints/hitos que se hayan alcanzado.

### 4. Actualiza el marcador `PROGRESO.md` (campaña; mecánicas en `11`)
1. **XP** según `11` §2 (solo actividad/accuracy). Recalcula **cinturón** de la asignatura.
2. **Racha:** marca el día en la rejilla.
3. **Bracket / medallas / tachado / barras** de cobertura y accuracy.

### 5. RECALIBRACIÓN AUTOMÁTICA + VEREDICTO  ← *lo que pidió el estudiante*
Compara, con datos, **lo planeado vs lo hecho** y dictamina. Reglas simples:

- **Ritmo:** trabajo restante (tipos/temas que faltan en `ROADMAP`) ÷ ritmo real (de los logs:
  tipos dominados/hora) → **horas necesarias** hasta cada examen. Compáralo con las horas que quedan
  en el `ROADMAP` (capacidad de `ESTUDIANTE.md`, **sin tocar los bloques fijos como el boxeo**).
- Escribe **una línea de veredicto** en `PROGRESO.md` (sección "Veredicto diario") respondiendo:
  1. ¿**Cumplió** el objetivo de hoy del roadmap? (sí / a medias / no)
  2. ¿Va **bien o mal** respecto al plan?
  3. ¿Necesita **más horas / más concentración**?
  4. ¿A **este ritmo llega** bien al examen, o no?
- **Actúa según el veredicto:**
  - Si va **en hora** → confirma y deja la fila de mañana lista.
  - Si va **algo retrasado** → ajusta el `ROADMAP` (mueve horas de "extras" a fundamentos; reparte lo
    pendiente en los próximos días) y dilo claro.
  - Si va **muy retrasado** (a este ritmo no llega) → **no mientas**: dispara `recalibrar`
    (`04` §5) y re-prioriza al **subconjunto de mayor nota** (Pareto), soltando lo demás.
- Anota el cambio en la **Bitácora de recalibración** del `ROADMAP.md`.

### 6. Narra la victoria (entrenador de esquina, `11` §8)
Delta de XP, cinturón, racha, ronda del torneo, y **una sola** acción para mañana. Si el día fue flojo:
honesto pero sin vergüenza ("el campamento sigue; mañana volvemos"). Luego **para**.

---

## DISPARADORES DE `recalibrar` (además del veredicto)
- El ritmo proyectado **no llega** a la nota objetivo antes del examen.
- **2–3 sesiones** de accuracy estancada o por debajo del plan.
- Cambian **fechas** de examen o aparece nueva carga.
- La racha se rompe varios días (mira también `10`: puede ser evitación, no solo horas).

## CONTINUIDAD
El **último log** (campo "Próximo paso") + la fila de mañana del `ROADMAP` le dicen a la próxima
`sesion` exactamente dónde retomar. Por eso esto no es burocracia: es lo que hace que cada round
empiece sin perder tiempo y que el recall espaciado funcione.
