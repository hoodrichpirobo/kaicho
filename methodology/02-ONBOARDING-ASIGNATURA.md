# 02 · ONBOARDING — Alta del cuatrimestre (TODAS las asignaturas a la vez)

> Gatillo: `onboard` (o "alta", "dar de alta", "monta el cuatrimestre"). Se hace **una vez por
> cuatrimestre**, con el modelo potente (p. ej. Claude Code). Ejecuta primero el arranque de `00`.
>
> **Aquí el coach hace TODA la organización pesada.** De este paso sale el sistema entero —el
> `ROADMAP.md` día a día— para que el uso diario (`sesion`/`fin`) sea trivial: solo "leer y ejecutar".
>
> **Salida:** por asignatura → `MAPA-ASIGNATURA.md` + `EXAMEN-PATRONES.md`. A nivel de cuatrimestre →
> `CALENDARIO.md` + `PANORAMA.md` + **`ROADMAP.md`** + `PROGRESO.md`.

Onboarding = ver el *fight tape* de **todos** los rivales antes de la temporada. No se entrena a ciegas.

---

## Step 0 · Carpetas
- Cuatrimestre activo: si no existe, `cp -r cuatrimestres/_TEMPLATE_CUATRIMESTRE cuatrimestres/<AAAA-MM_a_AAAA-MM>`.
- Pregunta **qué asignaturas** tiene el cuatrimestre y crea una carpeta por cada una:
  `cp -r .../asignaturas/_TEMPLATE_ASIGNATURA .../asignaturas/<ASIG>`.

## Step 1 · BLOQUEO POR MATERIAL (`07`) — para TODAS las asignaturas
**No se planifica sin material.** Exige el protocolo de `07` en **cada** asignatura: guía docente,
diapositivas/temas, ejercicios propuestos, prácticas y **exámenes de años anteriores** (con soluciones
si existen).

> **No generes el `ROADMAP.md` completo hasta tener los exámenes de años anteriores** de cada
> asignatura, o **confirmación explícita** de que no existen (principio 2). Si faltan, manda a por
> ellos (`07`) y para en esa asignatura.

Comprueba qué hay en `asignaturas/<ASIG>/` (material/, guía, exámenes) antes de seguir.

## Step 2 · INGESTA (todas las asignaturas)
Lee, por asignatura: la **guía docente** (temario, **pesos en la nota**, sistema y **fechas** de
evaluación) y el material. Para PDFs con esquemas/diagramas, recuerda `08`. Filtra señal vs ruido (`07` §5).

## Step 3 · Por cada asignatura → `MAPA-ASIGNATURA.md` + `EXAMEN-PATRONES.md`
- **MAPA:** temario, **pesos exactos**, tipo de evaluación, recursos por tema, gaps, dependencias
  visuales (`08`), mapa de prioridad (qué pesa más, qué depende de qué).
- **PATRONES:** mina los exámenes anteriores → tipos recurrentes y su **frecuencia**, peso/dificultad,
  el **subconjunto Pareto** (pocos tipos, mucha nota), trampas. Marca lo que solo se resuelve viendo
  el original (`08`).
- **Estrategia:** elige el *workpath* con `03` y **documenta el porqué** en el MAPA. Si lo óptimo es
  tradicional, recomiéndalo sin disculpas (principio 7).

## Step 4 · `CALENDARIO.md` (todas las fechas del cuatrimestre)
Vuelca las fechas de examen/entrega de todas las asignaturas, ordenadas. Marca ⚠️ lo no confirmado.

## Step 5 · `PANORAMA.md` (reparto de horas multi-asignatura)
Suma las horas reales (`ESTUDIANTE.md`, **respetando bloques fijos como el boxeo**) y repártelas por
**proximidad de examen + peso + riesgo**. Identifica el **pico de carga** (el "campeonato") y cómo
descongestionarlo (adelantar lo que cae después).

## Step 6 · `ROADMAP.md` (el conductor diario) — vía `04`
Genera el plan **inverso desde cada examen**, entrelazando todas las asignaturas, en una **tabla día a
día**: cada fila = fecha + asignatura + **tarea concreta troceada** + horas + estado. Reglas (`04`):
- **Camino mínimo efectivo primero** (Pareto): lo que captura el grueso de la nota es lo no negociable;
  el resto va como "extra si sobra tiempo".
- **Primera fila de cada asignatura = examen en frío** (pesaje), no al final.
- **Última semana antes de cada examen:** solo simulacros + huecos, nada de materia nueva.
- **Una tarea de arranque concreta por día** (energía de activación mínima).

## Step 7 · `PROGRESO.md` (marcador inicial)
Inicializa el tablero de campaña (`11`): XP 0 y cinturón ⬜ por asignatura, racha vacía, bracket en
"Clasificatorios", barras a 0, lista de tipos para tachar. El **rango de partida** de cada asignatura
queda **pendiente de su primer examen en frío** (primera `sesion`).

## Step 8 · Cierre
Resume al estudiante: temario, qué pesa, estrategia por asignatura y **cuál es el primer round del
roadmap**.
> "Ya conocemos a los rivales y tienes el roadmap entero hasta los exámenes. Mañana, primer round:
> escribe **`sesion`** y te digo qué toca."
Para. No arranques la sesión tú solo.

---

## Notas
- Si aparece material nuevo, vuelve a tocar MAPA/PATRONES y `recalibrar` si cambia el plan.
- La estrategia y el ROADMAP **pueden cambiar** a mitad de cuatrimestre si los datos lo piden (`03`, `04`, `06`).
