# 02 · ONBOARDING DE ASIGNATURA — Estudiar al rival antes de pelear

> Gatillo: `onboard <asignatura>` (o "alta de asignatura", "dar de alta").
> Ejecuta primero el protocolo de arranque de `00`. Esto se hace **una vez por asignatura**.
> Resultado: `MAPA-ASIGNATURA.md`, `EXAMEN-PATRONES.md`, `PLAN.md` y `PROGRESO.md` inicializado.

Onboarding = ver el *fight tape* antes del combate. No se entrena a ciegas: primero se estudia
cómo cae el examen y dónde está la nota.

---

## Step 0 · Crear la carpeta de la asignatura
Dentro del cuatrimestre activo, copia la plantilla de asignatura:
```
cp -r cuatrimestres/<cuatri>/asignaturas/_TEMPLATE_ASIGNATURA cuatrimestres/<cuatri>/asignaturas/<ASIG>
```
(Si aún no hay carpeta de cuatrimestre, créala copiando `cuatrimestres/_TEMPLATE_CUATRIMESTRE`.)

---

## Step 1 · BLOQUEO POR MATERIAL (paso bloqueante — `07`)
**No se planifica sin material.** Antes de nada, exige el protocolo de `07-RECOPILACION-MATERIAL.md`:
guía docente, diapositivas/temas, ejercicios propuestos, prácticas, **exámenes de años anteriores**
(con soluciones si existen), bibliografía.

> **No generes el `PLAN.md` completo hasta tener los exámenes de años anteriores**, o una
> **confirmación explícita** del estudiante de que no existen. Son el artefacto de mayor señal
> (principio 2 de `00`). Si faltan, manda a por ellos (`07`) y para aquí.

Comprueba qué hay:
```
ls -R cuatrimestres/<cuatri>/asignaturas/<ASIG>/guia-docente cuatrimestres/<cuatri>/asignaturas/<ASIG>/material
```

---

## Step 2 · INGESTA
Lee **todo**: `guia-docente/` y `material/` (powerpoints, bibliografía, ejercicios-propuestos,
prácticas-laboratorios, docencia-inversa, examenes-anteriores). De la **guía docente** extrae lo
crítico: temario (unidades/temas), **pesos de cada parte en la nota**, sistema y actos de
evaluación, fechas si las hay, bibliografía. Para PDFs con esquemas/diagramas, recuerda `08`.

---

## Step 3 · `MAPA-ASIGNATURA.md`
Redáctalo con (usa la plantilla de la asignatura como formato):
- **Temario** completo (unidades y temas).
- **Peso de cada parte en la nota** (parciales, prácticas, trabajos…). Exacto, desde la guía docente.
- **Tipo de evaluación** y actos (escrito/test/práctico; nota mínima si la hay; recuperación).
- **Recursos disponibles** por tema (qué powerpoint, qué ejercicios, qué vídeos, qué exámenes).
- **Gaps:** qué falta (temas sin material, exámenes sin solución, dudas).
- **Dependencias visuales (`08b`):** marca qué partes dependen de material visual no reproducible
  en texto (diagramas, esquemas, cronogramas, capturas) → habrá que mandar al original.
- **Mapa de prioridad:** qué pesa más en la nota y qué se construye sobre qué (dependencias entre temas).

---

## Step 4 · MINERÍA DE EXÁMENES → `EXAMEN-PATRONES.md`
Analiza los exámenes de años anteriores (cuantos más años, mejor señal). Extrae:
- **Tipos de ejercicio recurrentes** y su **frecuencia** (en cuántos exámenes aparecen).
- **Peso/puntos** típicos de cada tipo y su **dificultad**.
- Los **"ejercicios tipo" que dominan la nota** (el subconjunto Pareto: pocos tipos, mucha nota).
- Qué tipos **solo se resuelven viendo el original** (dependencia visual, `08b`) → márcalos.
- Patrones de redacción del profesor, trampas frecuentes, qué se repite casi idéntico cada año.

Esto es lo que convierte el estudio en "estudiar al rival": sabrás qué va a caer antes de que caiga.

---

## Step 5 · SELECCIÓN DE ESTRATEGIA (y documenta el porqué)
Con el MAPA y los patrones delante, elige la estrategia con la lógica de `03-ESTRATEGIAS.md`.
**Analiza la carpeta entera** y diseña el mejor *workpath* para ESTE caso (una estrategia del menú,
una híbrida o una nueva). **Documenta la elección y el porqué** en `MAPA-ASIGNATURA.md`.

> Si lo óptimo es la **tradicional** (diapositivas → ejercicios → exámenes), recomiéndala **sin
> disculpas** (principio 7 de `00`). Lo simple que funciona es lo correcto.

---

## Step 6 · `PLAN.md` (planificación inversa)
Genera el plan con `04-PLANIFICACION.md`: desde la fecha del examen hacia atrás, repartiendo carga
con el resto de asignaturas del cuatrimestre (lee `PANORAMA.md`). Camino mínimo efectivo + extras
"si sobra tiempo". Tareas diarias/semanales concretas, troceadas (divide y vencerás, `11`).

---

## Step 7 · Inicializar `PROGRESO.md` (estado de juego)
Inicializa el tablero (`11`): XP 0, cinturón ⬜ Blanco, racha vacía, bracket en "Clasificatorios",
barras de cobertura/accuracy a 0, lista de temas/tipos para tachar. El **rango de partida** queda
**pendiente del primer examen en frío** (primera `sesion`, `05` §1B).

---

## Step 8 · Cierre del onboarding
Resume al estudiante: temario, qué pesa, estrategia elegida y por qué, y cuál es el primer round.
> "Ya conocemos al rival. [N] tipos de ejercicio se llevan el [X]% de la nota. Mañana, pesaje:
> un examen en frío para ver de dónde partimos. Escribe **`sesion <ASIG>`** cuando estés listo."
Para. No arranques la sesión tú solo.

---

## Notas
- Repite este onboarding por cada asignatura del cuatrimestre.
- Si aparece material nuevo más adelante, vuelve a tocar MAPA y PATRONES (y `recalibrar` si cambia el plan).
- La estrategia **puede cambiar** a mitad de cuatrimestre si los datos lo piden (`03`, `04`).
