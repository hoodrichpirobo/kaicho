# 04 · PLANIFICACIÓN — Estudiar hacia atrás desde el examen

> Se usa en el onboarding (`02` Step 6) para generar el `ROADMAP.md` del cuatrimestre, y al `recalibrar`.
> Regla central: **el examen es el plano**. Se planifica **desde la fecha del examen hacia atrás**,
> y **entre todas las asignaturas del cuatrimestre a la vez** (lee `PANORAMA.md`).

---

## 1. ENTRADAS
- `MAPA-ASIGNATURA.md` (pesos, temario, dependencias) y `EXAMEN-PATRONES.md` (tipos que dominan la nota).
- `CALENDARIO.md` del cuatrimestre (fechas de exámenes y entregas).
- `PANORAMA.md` (carga colectiva de todas las asignaturas — para no planificar en un vacío).
- `perfil/ESTUDIANTE.md` (horas reales por día; ritmo de lectura/escritura para ajustar tiempos).

---

## 2. PLANIFICACIÓN INVERSA (método)
1. **Ancla en la fecha del examen.** Si no es exacta, usa la ventana estimada y márcala para confirmar.
2. **Retrocede en hitos:**
   - Última semana → **simulacros en frío en formato original** completos + repaso de huecos
     (no materia nueva). El simulacro ideal es un examen **VIRGEN** reservado del banco (`08` §3B).
   - Semanas centrales → **dominar los ejercicios tipo** por orden de peso en la nota (Pareto).
   - Primeras semanas → **pesaje** (examen en frío inicial) + cerrar fundamentos de los tipos top.
3. **Regla de los 2 exámenes (hitos obligatorios por asignatura).** Planifica explícitamente la
   cadena, con fechas: `examen A en frío (pesaje) → corregir y explicar el 100% → re-pasada ≥48 h
   (DOMINADO) → examen B en frío → corregir → re-pasada ≥48 h (DOMINADO)`. Si el banco da, reserva
   un **VIRGEN** para el simulacro final. Estados y criterios: `08` §3B. Si no existen 2 exámenes
   reales, compón el B con originales no expuestos (`07` §4). Estos hitos son **innegociables**: la
   recalibración recorta extras, no exámenes (§5).
4. **Camino mínimo efectivo primero.** Define el subconjunto que captura la mayor parte de la nota
   (p. ej. "3 tipos = 70%"). Eso es lo **no negociable**. Lo demás va como **extras "si sobra tiempo"**.
5. **Trocea** (divide y vencerás, `11`): convierte cada hito en tareas diarias factibles
   ("hoy: 2 ejercicios del tipo caché"), no en bloques inabarcables.
6. **Ajusta por ritmo real** (lectura/escritura lenta → más margen en tareas de lectura, pero las
   tareas se hacen igual).
7. **Planifica en trabajo efectivo, no en silla.** Fija para cada día un **objetivo de trabajo** (N
   originales en frío, N conceptos/puertas) con su **cap por ítem** (2× el ritmo del examen real;
   1× en la última semana — `05` §0C) y dimensiona contra la **capacidad efectiva** real (ritmo
   trabajo/hora de los logs, descontando el tiempo muerto histórico), no contra las horas-ventana.

---

## 3. REPARTO MULTI-ASIGNATURA (vía `PANORAMA.md`)
No se planifica una asignatura como si fuera la única:
- Suma las **horas disponibles** (de `ESTUDIANTE.md`) y repártelas entre asignaturas según
  **proximidad del examen** y **peso/riesgo** (una asignatura floja y cercana pesa más en el reparto).
- Identifica los **picos de carga** (varios exámenes juntos = el "campeonato") y descongestiónalos:
  adelanta trabajo de lo que cae después.
- **Rotación obligatoria (anti-atracón):** mientras haya ≥2 asignaturas con examen pendiente,
  **ningún día es mono-asignatura**. Cada día lleva **bloques de mantenimiento** (10–20 min por
  asignatura no principal: recall en frío de ítems débiles/banco, cuota en ítems y tope duro de
  tiempo) que van **ANTES** del **bloque principal**. Ninguna asignatura pasa **>24 h sin ítems en
  frío** (el mantenimiento cuenta). El atracón de una sola asignatura es evitación con buena prensa
  (`10` §2.3), no virtud: se planifica para que no quepa.
- Mantén `PANORAMA.md` actualizado: visión de pájaro de qué semana está cargada y por qué.

---

## 4. SALIDA: el `ROADMAP.md` del cuatrimestre (conductor diario)
Se vuelca en `cuatrimestres/<cuatri>/ROADMAP.md` (ver su plantilla): una **tabla día a día** donde
cada fila trae los **bloques** del día (`fecha · mantenimientos (cuota corta de las otras) · bloque
principal (asignatura + tarea troceada + objetivo de trabajo en ítems + cap por ítem) · horas ·
estado`), para que `sesion` solo lea la fila de HOY y declare el **CONTRATO DEL DÍA** (`05` §0B).
La cuota se escribe **siempre en ítems funcionales**, nunca solo en horas. Debajo, por asignatura,
el **banco de exámenes** (regla de los 2, `08` §3B), el camino mínimo (Pareto) y los extras:
```markdown
# (bloque por asignatura, dentro del ROADMAP) · <ASIG>
**Examen objetivo:** <fecha/ventana>  ·  **Nota objetivo:** <x>  ·  **Estrategia:** <de 03>
**Banco de exámenes (regla de los 2):** A <año> [estado] · B <año> [estado] · reserva <año> [VIRGEN]

## Camino mínimo efectivo (NO negociable) — captura ~<%> de la nota
- [ ] Dominar tipo A (peso ~%) — <n ejercicios> — fuente: <...>
- [ ] Dominar tipo B ...

## Extras (si sobra tiempo)
- [ ] Tipo C (peso bajo), teoría secundaria...

## Calendario semanal (hacia atrás desde el examen)
### Semana del <fecha> — <foco>
- L: <tarea troceada>   ·  X: <...>   ·  V: <...>
...
### Última semana — simulacros en frío + huecos
```
Usa la leyenda `[ ]` pendiente / `[~]` en curso / `[x]` hecho (como Orchestrator).

---

## 5. RECALIBRACIÓN  (gatillo `recalibrar`; disparadores al final de `06`)
Cuando el ritmo real no cuadra con el plan:
1. **Mide:** ritmo real (de los logs, `06`) × trabajo restante → horas necesarias vs disponibles.
2. **Di la verdad, sin promesas falsas** (principio 6 de `00`):
   > "A este ritmo no da para todo antes del examen. Tienes 2 opciones honestas: subir horas/día, o
   > clavar el subconjunto que vale más nota y soltar el resto. Yo te recomiendo lo segundo."
3. **Re-prioriza al subconjunto de mayor rendimiento.** Recorta extras antes que fundamentos.
   **Suelo intocable:** los hitos de la **regla de los 2 exámenes** y los **mantenimientos** no se
   recortan. Si de verdad no caben 2 exámenes dominados antes de la fecha, se dice con claridad y
   se decide con datos — pero por defecto caen extras y teoría pasiva, nunca los exámenes. Si una
   asignatura lleva **>24 h sin tocarse**, rebalancea ya: su mantenimiento de mañana es lo primero
   e innegociable y, si reincide, roba el bloque principal.
4. **Reescribe el `ROADMAP.md`** y actualiza `PANORAMA.md` (el recorte de una asignatura libera horas para
   otra). Refleja el cambio en el bracket del torneo (`11`).
5. Si la caída de ritmo huele a **evitación**, trátalo también desde `10` (no es solo un problema de horas).

---

## 6. PRINCIPIOS QUE NO SE ROMPEN AL PLANIFICAR
- Materia nueva **nunca** la última semana (solo simulacros + huecos).
- El **examen en frío** va al principio, no al final (pesaje, no premio).
- Los tipos visuales/espaciales se entrenan y validan sobre originales; nunca se sustituyen por
  preguntas terminales ya interpretadas. Reserva originales no expuestos para reválida (`08`).
- Si hay que elegir, gana **lo que más pesa en la nota**, no lo que más cómodo resulta.
- Cada día tiene **una tarea concreta de arranque** (energía de activación mínima, principio 4).
- **Regla de los 2 exámenes:** ninguna asignatura se da por lista sin ≥2 exámenes de años distintos
  DOMINADOS; el simulacro final sale de un VIRGEN reservado si el banco lo permite (`08` §3B).
- **Ningún día mono-asignatura** con ≥2 exámenes pendientes: mantenimiento antes que bloque principal.
- **Caps por ítem desde el ritmo del examen real** (entreno 2×, última semana 1×); la cuota se
  escribe en ítems, no en horas (`05` §0C).
