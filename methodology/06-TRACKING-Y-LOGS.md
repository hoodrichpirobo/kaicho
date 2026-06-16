# 06 · FIN DE SESIÓN — Log, marcador y recalibración automática

> Gatillo: **`fin`** ("fin de sesión", "cerrar", "fin del round"). Se ejecuta al terminar cada `sesion`.
> Aquí el trabajo del día se vuelve **datos** (para calibrar), **dopamina** (para volver mañana) y un
> **veredicto honesto**. Es deliberadamente mecánico: lee, registra, compara, dictamina. Pensado para
> ejecutarse a diario incluso en un modelo menos potente.

---

## PASOS DEL `fin` (en orden, sin saltarte ninguno)

### 1. Cierra el crono y reparte el tiempo (bitácora)
Para el cronómetro y cierra la **bitácora** (`05` §0/§6). Reparte el tiempo en tres, con los sellos `date`:
- **Silla** = T0 → cierre (lo que duró la sesión de punta a punta).
- **Efectivo** = silla − pausas − **tiempo muerto** (lo realmente trabajado). **Esto es lo que cuenta.**
- **Muerto** = huecos sin trabajo (tramos entrega→regreso desproporcionados, ausencias sin pausa).
  Un ítem pasado de su cap **sin TIMEOUT declarado** (`05` §0C) se suma aquí.
- **Distracciones (`05` §6):** el tiempo de cada captura con `distraccion` es **pausa** (ni efectivo ni
  muerto). Pero si habló de una distracción **sin** usar el comando y eso **rompió un cap**, ese tramo
  **sí** es **tiempo muerto/evitación** y se descuenta como muerto.

Si silla ≫ efectivo, **dilo sin maquillar** en el veredicto y aplica la consecuencia (§6). "Llevas 3 h"
no es lo mismo que "trabajaste 1 h efectiva": aquí se separan, y solo la efectiva es estudio.

### 2. Auditoría de integridad del entrenamiento (`08`)
Antes de calcular accuracy, XP o dominio, revisa cada ejercicio:
- `ORIGINAL-FRÍO`: formato original y ninguna ayuda/preinterpretación → sí puede contar para accuracy.
- `ORIGINAL-ASISTIDO`: hubo intento propio del original y luego ayuda → práctica/cobertura, no accuracy.
- `PREINTERPRETADO`: el coach tradujo/extrajo/clasificó antes del intento o se vio solución → no
  valida preparación de examen; registra la violación y deja reválida pendiente.

Si un ejercicio visual se planteó por terminal o el coach dio rutas/datos visibles ya seleccionados,
**reclasifícalo como `PREINTERPRETADO` aunque el resultado final sea correcto**. Retira cualquier
afirmación previa de dominio, hueco cerrado o nota proyectada.

### 3. Escribe el log fechado (un fichero por sesión)
En `cuatrimestres/<cuatri>/asignaturas/<ASIG>/LOGS/AAAA-MM-DD_<ASIG>[_n].md` (`_n` si hay >1 ese día):

```markdown
# Log · <ASIG> · <AAAA-MM-DD>
- **Round nº:** <n>   ·   **Tiempo:** silla <h:mm> · **efectivo <h:mm>** · muerto <h:mm>
- **Tipo:** examen en frío | ejercicios tipo | recall espaciado | mixta

## Bloques del día (el CONTRATO, `05` §0B)
- Mantenimiento <ASIG-2>: <n/n ítems en frío> → **CUMPLIDO / PARCIAL / NO**
- Mantenimiento <ASIG-3>: <n/n ítems en frío> → **CUMPLIDO / PARCIAL / NO**
- Bloque principal <ASIG-1>: <cuota> → **CUMPLIDO / PARCIAL / NO**
- **Día completo (TODOS los bloques): SÍ / NO**

## Bitácora de ítems (control por ítem, `05` §0C)
| # | Ítem (fuente exacta) | Inicio | Fin | Min | Cap | Etiqueta | ✓/✗ | TIMEOUT |
|---|---|---|---|---|---|---|---|---|
| 1 | <examen/página/nº> | <hh:mm> | <hh:mm> | <m> | <m> | FRÍO/ASISTIDO/PREINTERPRETADO/REPASADO-FRÍO | ✓ | — |
- **Min/ítem medio:** <m> vs cap <m>  ·  **TIMEOUT declarados:** <n>  ·  **Ítems sobre cap sin TIMEOUT:** <n> (→ tiempo muerto)

## Trabajo efectivo (la cuota, no la silla)
- **Cuota del día (del ROADMAP):** <objetivo de trabajo> → **CUMPLIDA / PARCIAL / NO**
- **Originales tocados:** <n> (<cuáles>)   ·   **Ejercicios en frío:** <intentados>/<superados>
- **Conceptos/puertas cerradas:** <lista>   ·   **Reválidas hechas/pendientes:** <...>
- **Banco de exámenes tocado hoy:** <examen> → <VIRGEN / EN TRABAJO / DOMINADO / QUEMADO> (`08` §3B)
- **Ritmo:** <trabajo por hora efectiva, p. ej. "1,5 originales/h">   ·   **Tiempo muerto:** <h:mm> — <causa>

## Qué se hizo (activo)
- <tarea/original exacto> — <tiempo> — <ORIGINAL-FRÍO | ORIGINAL-ASISTIDO | PREINTERPRETADO> — resultado

## Puertas verificadas (`08`)
| Tipo/ejercicio | Comprensión textual | Visual/notacional | Modelado/plan | Ejecución |
|---|---|---|---|---|
| <...> | frío/asistido/pendiente | frío/asistido/N-A/pendiente | frío/asistido/pendiente | frío/asistido/pendiente |

## Accuracy válida de examen
> Solo intentos `ORIGINAL-FRÍO`; lo asistido no entra en el denominador ni numerador.
| Tipo | Originales en frío intentados | Correctos en frío | % |
|---|---|---|---|

## Práctica asistida / reválidas pendientes
- <tipo> — ayuda recibida / puerta preinterpretada — <otro original que debe resolver en frío>

## Recall espaciado
- Cerrados (acertados en frío): <...> → +XP   ·   Aún débiles: <...>

## Distracciones aparcadas (`05` §6 — OBLIGATORIO si las hubo)
> Vuelca aquí lo de `SESION-ACTIVA.md`. El tiempo de captura fue **pausa, no efectivo**.
| Hora | Texto bruto (literal) | ¿Atendida? | Decisión (si aplica) |
|---|---|---|---|
| <hh:mm> | "<lo que escribió, sin reformular>" | sí / no | <p. ej. "a la lista del finde" / "nada" / "se hizo pausa real"> |

## Psicología observada (para perfil/PSICOLOGIA.md)
- ¿Evitación? ¿Qué la disparó/rompió? ¿A qué hora rindió?

## Próximo paso (UNO solo)
- <la única acción para mañana>
```
> **Append-only:** no reescribas logs viejos. Un fichero nuevo por sesión.

> **Distracciones aparcadas:** si `cuatrimestres/<cuatri>/SESION-ACTIVA.md` tiene distracciones del
> round, **vuélcalas (obligatorio) a la sección "Distracciones aparcadas"** del log —hora, texto bruto
> literal, si se atendió y la decisión— y **vacía** el parking de `SESION-ACTIVA.md` para el próximo
> round. El tiempo de captura ya quedó como **pausa** (§1), no como efectivo. Si alguna distracción
> revela un patrón (a qué hora salta, qué la dispara), llévalo también a "Psicología observada".

### 4. Marca el `ROADMAP.md`
En la fila de HOY del `cuatrimestres/<cuatri>/ROADMAP.md`: `[x]` **solo si se cumplieron TODOS los
bloques** (mantenimientos + principal); `[!]` si faltó cualquiera (aunque el principal fuera
glorioso) o quedó a medias. Tacha los checkpoints/hitos alcanzados y actualiza el estado del **banco
de exámenes** de la asignatura si cambió (`08` §3B).

### 5. Actualiza el marcador `PROGRESO.md` (campaña; mecánicas en `11`)
1. **XP** según `11` §2 (solo actividad/accuracy). Recalcula **cinturón** de la asignatura.
2. **Racha:** marca el día en la rejilla.
3. **Bracket / medallas / tachado / barras** de cobertura y accuracy.
4. **Accuracy, nota actual en frío, dominio y huecos cerrados:** solo con `ORIGINAL-FRÍO`.
5. Mantén visibles las **reválidas pendientes**. Un resultado asistido puede aumentar cobertura,
   pero no la barra de accuracy ni el rango proyectado.
6. **Métricas de trabajo efectivo:** acumula tiempo efectivo vs silla vs muerto, ritmo (trabajo/hora
   efectiva) y **cuotas cumplidas**. Si hubo tiempo muerto u órdenes impuestas, refléjalo en la línea
   **"Órdenes / disciplina activas"** del `PROGRESO`.
7. **Regla de los 2 exámenes y rotación:** actualiza por asignatura el contador **"Exámenes
   dominados x/2"** y el estado del banco; actualiza los **"días sin tocar"** de cada asignatura
   (el mantenimiento cuenta como tocar; >24 h con examen pendiente = bandera para mañana).

### 6. RECALIBRACIÓN AUTOMÁTICA + VEREDICTO  ← *lo que pidió el estudiante*
Compara, con datos, **lo planeado vs lo hecho** y dictamina. Reglas simples:

- **Ritmo:** trabajo restante (tipos/temas que faltan en `ROADMAP`) ÷ ritmo real **efectivo** (de los
  logs: tipos dominados / **hora efectiva**, descontando tiempo muerto) → **horas efectivas
  necesarias** hasta cada examen. Compáralo con las horas que quedan en el `ROADMAP` (capacidad de
  `ESTUDIANTE.md`, **sin tocar los bloques fijos como el boxeo**).
- Escribe **una línea de veredicto** en `PROGRESO.md` (sección "Veredicto diario") respondiendo:
  1. ¿**Cumplió la cuota de trabajo** de hoy? (sí / parcial / no) — la cuota, no la silla.
  2. ¿Cuánto **tiempo muerto** hubo y va **bien o mal** respecto al plan?
  3. ¿Necesita **más trabajo efectivo / más concentración** (no solo "más horas")?
  4. ¿A **este ritmo efectivo llega** bien al examen, o no?
  5. ¿**Día completo**? (todos los bloques: mantenimientos + principal) ¿O alguna asignatura quedó
     muerta hoy?
  6. ¿Hubo **ítems sobre cap sin TIMEOUT** (tiempo muerto) y cuántos TIMEOUT legítimos?
  7. ¿Va **en hora la regla de los 2 exámenes**? (exámenes DOMINADOS vs días restantes, por asignatura)
- La proyección usa únicamente evidencia `ORIGINAL-FRÍO`. Si solo hay aciertos asistidos, dilo:
  **"entiende con ayuda; preparación de examen aún sin verificar"**. No proyectes una nota optimista.
- **Actúa según el veredicto:**
  - Si va **en hora** → confirma y deja la fila de mañana lista.
  - Si va **algo retrasado** → ajusta el `ROADMAP` (mueve horas de "extras" a fundamentos; reparte lo
    pendiente en los próximos días) y dilo claro.
  - Si va **muy retrasado** (a este ritmo no llega) → **no mientas**: dispara `recalibrar`
    (`04` §5) y re-prioriza al **subconjunto de mayor nota** (Pareto), soltando lo demás — pero el
    suelo de la regla de los 2 exámenes y los mantenimientos no se tocan (`04` §5).
  - Si una asignatura lleva **>24 h sin tocarse** → mañana su mantenimiento va primero e
    innegociable; si reincide, roba el bloque principal.
- **Disciplina y consecuencia (nivel de decepción):** si hubo tiempo muerto o la cuota quedó NO/parcial
  por evitación, el veredicto **no es neutro**: regaño firme y data-backed (`10`) sobre la conducta e
  **impón** una corrección concreta para mañana (arranque más temprano, franja pico bloqueada, trabajo
  recolocado, sesión extra). Si clavó la cuota con poco tiempo muerto, **reconócelo fuerte** (eso se
  celebra, no las horas). La identidad jamás se toca (`10`).
- Anota el cambio en la **Bitácora de recalibración** del `ROADMAP.md`.

### 7. Narra la victoria (entrenador de esquina, `11` §8)
Delta de XP, cinturón, racha, ronda del torneo, y **una sola** acción para mañana. Celebra **la cuota
clavada y el foco limpio** (poco tiempo muerto), no la silla. Si el día fue flojo: honesto y duro con
la conducta pero **sin tocar la identidad** ("el campamento sigue; mañana se arranca a la hora y se
clava el primer original"). Luego **para**.

---

## DISPARADORES DE `recalibrar` (además del veredicto)
- El ritmo proyectado **no llega** a la nota objetivo antes del examen.
- **2–3 sesiones** de accuracy estancada o por debajo del plan.
- Cambian **fechas** de examen o aparece nueva carga.
- La racha se rompe varios días (mira también `10`: puede ser evitación, no solo horas).
- Una asignatura con examen pendiente lleva **>24 h sin ítems en frío** (rotación rota).
- El banco no da para **2 exámenes DOMINADOS** antes de la fecha → activa el examen B compuesto
  (`07` §4) o recorta extras ya; si ni así, dilo en el veredicto (riesgo de *overfitting*).

## CONTINUIDAD
El **último log** (campo "Próximo paso") + la fila de mañana del `ROADMAP` le dicen a la próxima
`sesion` exactamente dónde retomar. Por eso esto no es burocracia: es lo que hace que cada round
empiece sin perder tiempo y que el recall espaciado funcione.
