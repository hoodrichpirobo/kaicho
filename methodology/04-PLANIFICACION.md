# 04 · PLANIFICACIÓN — Estudiar hacia atrás desde el examen

> Se usa al final del onboarding (`02` Step 6) para generar `PLAN.md`, y al `recalibrar`.
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
   - Última semana → **simulacros en frío** completos + repaso de huecos (no materia nueva).
   - Semanas centrales → **dominar los ejercicios tipo** por orden de peso en la nota (Pareto).
   - Primeras semanas → **pesaje** (examen en frío inicial) + cerrar fundamentos de los tipos top.
3. **Camino mínimo efectivo primero.** Define el subconjunto que captura la mayor parte de la nota
   (p. ej. "3 tipos = 70%"). Eso es lo **no negociable**. Lo demás va como **extras "si sobra tiempo"**.
4. **Trocea** (divide y vencerás, `11`): convierte cada hito en tareas diarias factibles
   ("hoy: 2 ejercicios del tipo caché"), no en bloques inabarcables.
5. **Ajusta por ritmo real** (lectura/escritura lenta → más margen en tareas de lectura, pero las
   tareas se hacen igual).

---

## 3. REPARTO MULTI-ASIGNATURA (vía `PANORAMA.md`)
No se planifica una asignatura como si fuera la única:
- Suma las **horas disponibles** (de `ESTUDIANTE.md`) y repártelas entre asignaturas según
  **proximidad del examen** y **peso/riesgo** (una asignatura floja y cercana pesa más en el reparto).
- Identifica los **picos de carga** (varios exámenes juntos = el "campeonato") y descongestiónalos:
  adelanta trabajo de lo que cae después.
- Mantén `PANORAMA.md` actualizado: visión de pájaro de qué semana está cargada y por qué.

---

## 4. FORMATO DE `PLAN.md`
Estructura sugerida (ver plantilla de la asignatura):
```markdown
# PLAN · <ASIG>
**Examen objetivo:** <fecha/ventana>  ·  **Nota objetivo:** <x>  ·  **Estrategia:** <de 03>

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

## 5. RECALIBRACIÓN  (gatillo `recalibrar`; disparadores en `06` §4)
Cuando el ritmo real no cuadra con el plan:
1. **Mide:** ritmo real (de los logs, `06`) × trabajo restante → horas necesarias vs disponibles.
2. **Di la verdad, sin promesas falsas** (principio 6 de `00`):
   > "A este ritmo no da para todo antes del examen. Tienes 2 opciones honestas: subir horas/día, o
   > clavar el subconjunto que vale más nota y soltar el resto. Yo te recomiendo lo segundo."
3. **Re-prioriza al subconjunto de mayor rendimiento.** Recorta extras antes que fundamentos.
4. **Reescribe `PLAN.md`** y actualiza `PANORAMA.md` (el recorte de una asignatura libera horas para
   otra). Refleja el cambio en el bracket del torneo (`11`).
5. Si la caída de ritmo huele a **evitación**, trátalo también desde `10` (no es solo un problema de horas).

---

## 6. PRINCIPIOS QUE NO SE ROMPEN AL PLANIFICAR
- Materia nueva **nunca** la última semana (solo simulacros + huecos).
- El **examen en frío** va al principio, no al final (pesaje, no premio).
- Si hay que elegir, gana **lo que más pesa en la nota**, no lo que más cómodo resulta.
- Cada día tiene **una tarea concreta de arranque** (energía de activación mínima, principio 4).
