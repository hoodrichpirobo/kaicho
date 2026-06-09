# 03 · ESTRATEGIAS — Elegir el camino de mayor rendimiento

> Se usa dentro del onboarding (`02` Step 5) y se revisa al `recalibrar` (`04`). El coach elige
> **por asignatura, después de la ingesta y la minería de exámenes**, y **documenta el porqué** en
> `MAPA-ASIGNATURA.md`.

**Principio rector:** no hay una estrategia "avanzada" superior por defecto. La correcta es la que
da **más nota por unidad de esfuerzo** (principio 1 de `00`) para *esta* asignatura concreta.
**La tradicional es de primera clase** y a menudo la correcta; no se descarta por parecer "poco sofisticada".

> El menú de abajo es **un punto de partida para pensar, no un molde cerrado ni literal**. Puede
> haber otras estrategias —e incluso mejores— para cada caso. Lo que importa es **analizar a fondo
> la carpeta entera** y, a partir de ahí, diseñar el mejor *workpath* ("jueguito") que el estudiante
> va completando (`11`): una de estas, una híbrida, o una nueva.

---

## El menú (típicas, no exhaustivas)

### A · Tradicional
Diapositivas/teoría → ejercicios propuestos → exámenes.
- **Cuándo:** material autocontenido y de calidad; teoría que se construye sobre sí misma; pocos
  exámenes antiguos o poco "tipo".
- **El coach la recomienda sin disculpas** cuando encaja. Sigue siendo activa: se intenta antes de leer.

### B · Examen-first / Socrático
Empezar por los exámenes; la teoría se entrega *just-in-time* según el estudiante falla.
- **Cuándo:** exámenes muy "tipo" y repetitivos; diapositivas crípticas; teoría inferible desde los
  ejercicios. Encaja de fábrica con el motor de recuperación (`09`).
- **Integridad:** se empieza desde el **original**. Si el formato/diagrama exige reconocer patrones,
  el coach no lo traduce por terminal antes del intento (`08`).

### C · Docencia inversa
Vídeos del profesorado (*flipped classroom*) → ejercicios.
- **Cuándo:** existe material de docencia inversa/vídeos que cubre la teoría mejor que las diapositivas.
- Ojo: ver vídeo es **pasivo**. Conviértelo en activo: pausa y auto-pregunta, y salta a ejercicios pronto.

### D · Pattern-mining puro
Solo exámenes de años anteriores, repetidos hasta dominar los tipos.
- **Cuándo:** el análisis muestra que **N tipos cubren casi toda la nota** y se repiten casi idénticos
  cada año. Máximo Pareto.
- Reserva originales no expuestos para comprobar que reconoce el patrón sin que el coach anuncie
  el tipo. Repetir una versión ya preinterpretada no valida dominio (`08`).

---

## Lógica de selección (heurística)
Tras la minería de exámenes (`02` Step 4), pregúntate:
1. **¿Pocos tipos cubren mucha nota y se repiten?** → tira a **D** (o **B** con sesgo pattern-mining).
2. **¿Las diapositivas son crípticas pero los exámenes son claros y tipo?** → **B**.
3. **¿Hay buenos vídeos que explican mejor que las diapositivas?** → **C** para la teoría + B/A para practicar.
4. **¿Material autocontenido, teoría acumulativa, exámenes variados?** → **A**.
5. **¿Mezcla?** Casi siempre. Lo normal es un **híbrido**: p. ej. "B para los temas de problemas,
   A para los de teoría conceptual, C para el tema que solo se entiende en vídeo".

Diseña el resultado como un **workpath jugable** (trozos con XP, `11`), no como un temario lineal.

---

## Documentar la elección (obligatorio)
En `MAPA-ASIGNATURA.md`, deja escrito algo así:
```markdown
## Estrategia elegida
- **Estrategia:** B (Examen-first) híbrida con A para los 2 temas conceptuales.
- **Por qué:** 12 exámenes analizados; 4 tipos de ejercicio = ~75% de la nota; diapositivas densas
  y poco claras; la teoría de esos 4 tipos se infiere resolviendo. Los temas T_x y T_y son
  conceptuales y sin ejercicio tipo → se tratan tradicional.
- **Revisión:** reevaluar tras el primer examen en frío y a mitad de cuatrimestre.
```

---

## La estrategia evoluciona
No es una decisión para siempre. Cambia según entran datos:
- Tras el **examen en frío** inicial (rango de partida real).
- A **mitad de cuatrimestre** (qué está funcionando según accuracy y ritmo, `06`).
- Si aparece **material nuevo** o cambian fechas (`recalibrar`, `04`).

Si los datos dicen que el camino elegido no rinde, **cámbialo sin orgullo**. El objetivo es la
nota por esfuerzo, no defender una decisión.
