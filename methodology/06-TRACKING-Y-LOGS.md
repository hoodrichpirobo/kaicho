# 06 · TRACKING Y LOGS — Memoria, métricas y estado de juego

> Gatillo: `log` (o "cerrar sesión", "fin del round"). También se ejecuta al final de cada `sesion`.
> Inspirado en los logs de sesión fechados de Orchestrator, adaptado a preparación de exámenes.
> Aquí se convierte el trabajo del día en **datos** (para calibrar) y en **dopamina** (para volver mañana).

---

## 1. EL LOG FECHADO (un fichero por sesión)

Cada sesión deja **un fichero** en `cuatrimestres/<cuatri>/asignaturas/<ASIG>/LOGS/`, nombrado:

```
LOGS/AAAA-MM-DD_<asignatura>[_n].md      # _n solo si hay >1 sesión de esa asig ese día
# ej.: LOGS/2026-03-14_ETC.md
```

Plantilla del log (rellena todos los campos; los que no apliquen, "—"):

```markdown
# Log · <ASIG> · <AAAA-MM-DD>

- **Round nº:** <n de la asignatura>
- **Horas reales de estudio:** <h:mm>  (cronometradas, EXCLUYENDO pausas)
- **Tipo de sesión:** examen en frío | ejercicios tipo | recall espaciado | teoría just-in-time | mixta

## Qué se hizo (activo)
- <tarea 1> — <tiempo> — resultado
- <tarea 2> — <tiempo> — resultado

## Accuracy en ejercicios tipo
| Tipo de ejercicio | Intentados | Correctos sin pista | % |
|---|---|---|---|
| <tipo> | n | k | kk% |

## Recall espaciado
- Ítems re-preguntados: <lista>
- Cerrados (acertados en frío): <lista>  →  +XP
- Aún débiles: <lista>  →  re-preguntar próxima sesión

## Cobertura
- Temas/tipos tocados hoy: <...>
- Cobertura acumulada de la asignatura: <%>

## Estado de juego (resumen, detalle en PROGRESO.md)
- XP: <antes> → <después> (+<delta>)   ·  Cinturón: <...>
- Racha: 🔥 <n> días   ·  Bracket: <ronda>

## Psicología observada (para perfil/PSICOLOGIA.md)
- ¿Hubo evitación? ¿Qué la disparó? ¿Qué la rompió? ¿A qué hora rindió mejor?

## Próximo paso (UNO solo)
- <la única acción concreta para la próxima sesión>
```

> **Append-only en espíritu:** no reescribas logs viejos. Cada sesión, un fichero nuevo. La historia
> se conserva entera (igual que el `session-log.jsonl` de Orchestrator, pero legible y fechado).

---

## 2. USA LAS HORAS REGISTRADAS PARA EL SEGUIMIENTO

Las **horas reales cronometradas** (sin pausas) son tu instrumento de calibración:
- **Estimar lo que falta:** ritmo actual (p. ej. "1,5 tipos dominados/hora") × tipos restantes →
  horas necesarias hasta el examen. Compáralo con las horas disponibles del `PLAN.md`/`PANORAMA.md`.
- **Detectar caídas de ritmo:** si las horas/día bajan o la accuracy se estanca varias sesiones,
  es señal temprana (a menudo evitación; cruza con `10`).
- **Calibrar el plan:** si el ritmo real no llega a la nota objetivo, **dilo claro** y dispara
  `recalibrar` (§4).

---

## 3. ACTUALIZA EL ESTADO DE JUEGO (`PROGRESO.md`)

En cada `log`, actualiza `PROGRESO.md` (mecánicas en `11`):
1. **XP** según la tabla de `11` §2 (solo actividad/accuracy). Recalcula **cinturón**.
2. **Racha:** marca el día en la rejilla de contribuciones. Actualiza la racha actual.
3. **Bracket:** avanza de ronda si se cumplió un hito (tipo dominado, cobertura, nota en frío).
4. **Medallas/tachado:** otorga medalla si se alcanzó un hito; tacha temas/tipos completados.
5. **Barras** de cobertura y accuracy por bloque/tipo.

Luego **narra la victoria** (`11` §8) y deja el próximo paso.

---

## 4. DISPARADORES DE RECALIBRACIÓN

Dispara `recalibrar` (ejecuta `04` §recalibración) cuando:
- El ritmo real proyectado **no llega** a la nota objetivo antes del examen.
- Se acumulan **2–3 sesiones** de accuracy estancada o por debajo de lo planificado.
- Cambian las **fechas** de examen o aparece nueva carga (otra asignatura, entrega).
- La racha se rompe varios días (revisa también lo psicológico, `10`).

Al recalibrar, sé honesto y re-prioriza al **subconjunto de mayor rendimiento** (principio 1 y 6
de `00`). Nada de promesas falsas: "a este ritmo no da para todo; clavamos los 3 tipos que valen
el 70% de la nota y soltamos el resto".

---

## 5. CONTINUIDAD ENTRE SESIONES
Al arrancar una `sesion`, el **último log** te dice exactamente dónde retomar (campo "Próximo
paso") y qué ítems siguen débiles. Por eso el log no es burocracia: es lo que permite que cada
round empiece sin perder tiempo y que la recuperación espaciada funcione.
