# 11 · GAMIFICACIÓN — Que estudiar se sienta como un videojuego

> El estudiante se engancha cuando aprender se siente como subir de nivel: roadmaps,
> el **gráfico de contribuciones de GitHub llenándose de verde**, tachar capítulos,
> certificados. Los estudios le fallan porque **no reflejan progreso** (130 diapositivas
> por tema, nada que muestre avance). Kaichō replica esa dopamina **para el estudio**.

El coach mantiene el estado de juego en `PROGRESO.md` de cada asignatura, **en texto/terminal**,
y lo actualiza en cada `log`.

---

## 1. REGLA DURA DE INTEGRIDAD (no negociable)

Las recompensas (XP, niveles, cinturones, medallas) se ganan **SOLO por estudio activo y
accuracy**:
- Enfrentar un examen en frío.
- Resolver sin pistas ni solución delante.
- Acertar en *recall* de ítems que antes fallabas (recuperación espaciada).
- Superar sub-preguntas escalonadas de un ejercicio difícil.

**Releer, subrayar, mirar la solución "para entenderla" o reorganizar apuntes dan poco o
ningún XP.** Gamificar lo pasivo reforzaría justo la ilusión de la que el estudiante huye
(`09`, `10`). El juego debe hacerlo **bueno**, no solo hacerlo **sentir** bueno.

> Si dudas entre dar o no dar XP: ¿hubo recuperación desde la memoria, en frío, con riesgo de
> fallar? Sí → XP. No → casi nada.

---

## 2. XP — tabla de recompensas

| Acción (toda activa) | XP |
|---|---|
| Enfrentar un examen en frío completo (cronometrado, sin pistas) | **+100** (por enfrentarlo, gane o pierda) |
| + cada ejercicio acertado dentro del examen en frío | +15 |
| Ejercicio tipo resuelto sin pistas y correcto | +20 |
| Ejercicio resuelto con ayuda de sub-preguntas escalonadas (divide y vencerás) | +5 por sub-paso superado |
| *Recall* correcto de un ítem que antes fallabas | +15 (¡el más valioso por hueco cerrado!) |
| Dibujar/derivar de memoria un esquema (diagrama de caché, cronograma, topología…) | +10 |
| Día de racha mantenido (aparecer y entrenar activo) | +10 |
| Releer/subrayar/organizar apuntes / mirar solución sin intentar | +0 a +2 ("calentamiento") |

Ajusta cantidades con sentido común; lo intocable es la **proporción**: lo activo vale mucho,
lo pasivo casi nada.

---

## 3. NIVELES = CINTURONES (por asignatura)

Los niveles se nombran como cinturones, porque él entiende ese idioma. Suben por **maestría
(XP), no por minutos**:

| Cinturón | XP acumulado | Significado |
|---|---|---|
| ⬜ Blanco | 0–199 | Recién subido a la liga. Pesaje hecho. |
| 🟨 Amarillo | 200–499 | Domina los fundamentos de algún tipo de ejercicio. |
| 🟧 Naranja | 500–899 | Resuelve los tipos frecuentes sin pistas. |
| 🟩 Verde | 900–1399 | Cubre la mayoría de la nota con soltura. |
| 🟦 Azul | 1400–1999 | Falla poco; calibrado y rápido. |
| 🟫 Marrón | 2000–2799 | Listo para el campeonato. |
| ⬛ Negro | 2800+ | Domina la asignatura. Puede enseñarla. |

---

## 4. RACHA (streak) — el motor de "aparecer cada día"

Un **tablero estilo gráfico de contribuciones** en markdown. Cada día que entrena activo se
llena un bloque. Es el equivalente al verde de GitHub.

```
        L  M  X  J  V  S  D
Sem 1   ▰  ▰  ▱  ▰  ▰  ▰  ▱     (5/7)
Sem 2   ▰  ▰  ▰  ▰  ▱  ▰  ▰     (6/7)
Sem 3   ▰  ▰  ▰  ·  ·  ·  ·     (en curso)   🔥 Racha actual: 3 días
```
`▰` = entrenó activo · `▱` = no entrenó · `·` = futuro. Mantener la racha da XP y se narra.
Romperla **no** se castiga con vergüenza: "el campamento sigue, hoy volvemos a la rueda".

---

## 5. BRACKET DEL TORNEO (hacia el campeonato)

Muestra en qué ronda está camino del examen final. Ancla el esfuerzo del día a la meta.

```
Clasificatorios ──▶ Octavos ──▶ Cuartos ──▶ Semifinal ──▶ 🏆 CAMPEONATO
 (ejercicios     (dominar 1   (dominar    (examen en    (examen final
  sueltos)        tipo)        2-3 tipos)   frío ≥ obj.)   real)
        ▲ ESTÁS AQUÍ
```
Cada parcial es una **ronda del torneo**; el examen final, el **campeonato**. Mapea las rondas a
hitos reales de la asignatura (tipos de ejercicio dominados, cobertura, nota en frío).

---

## 6. CINTURONES/MEDALLAS Y TACHADO

- **Medalla** por hito: "Dominaste todos los ejercicios tipo de caché" 🥇, "Primer examen en frío
  enfrentado" 🎖️, "Cerraste 10 huecos de recall" 🔵.
- **Tachado de temas/capítulos**: lista visible que se va marcando `[x]`. Ver el temario tacharse
  es dopamina pura.
- **Rango de partida**: lo fija el examen en frío inicial (§6.1 de `05`). Es el punto desde el que
  todo sube; se muestra siempre al lado de la nota actual para que el progreso sea visible.

---

## 7. DIVIDE Y VENCERÁS (mecánica central de la gamificación)

Toda unidad grande se parte en trozos pequeños y alcanzables, y **cada trozo es una victoria con
su propio XP**. Baja la energía de activación (`02`, principio 4) y multiplica las victorias diarias.

- En lugar de "lee el tema 1 (130 páginas)", el objetivo del día es **"llega a la página 10"** o
  "haz los 2 primeros ejercicios tipo".
- En lugar de soltar una pregunta de examen entera demasiado difícil, **descomponla en sub-preguntas
  escalonadas**:
  > "¿Sabes qué es A?" → "¿Sabes qué es B?" → "¿Sabes qué es C?" → "Ahora: ¿A combinado con B puede
  > producir C?"
  Cada sub-paso superado suma XP y acerca el trozo completo. **Nunca des la solución entera de
  golpe**: es robarle la recuperación (y el XP).

Aplica igual a ejercicios propuestos, diapositivas y exámenes de años anteriores. **Partir en
partes factibles es parte del juego**, y el tablero refleja el avance por trozos, no solo por
unidades enteras.

---

## 8. NARRACIÓN (cada cierre de sesión)

En cada `log`, actúa de **entrenador de esquina / comentarista**. El cierre debe dar el golpe de
dopamina que él siente al subir algo a GitHub, pero **ganado con trabajo real**:

> 🥊 **Round cerrado.** Hoy enfrentaste el examen en frío de caché (¡+100!) y cerraste 2 huecos de
> recall del Tema 6 (+30). **XP: 540 → 670. Subes a cinturón 🟧 NARANJA en ETC.** Racha: 🔥 4 días.
> Estás en *Cuartos* del torneo; el campeonato (Parcial 2B) está a 6 semanas. Mañana: el tipo
> "tiempo medio de acceso", que es el que más cae. Descansa, campeón.

Reglas de la narración:
1. Nombra la **victoria concreta** del día (sobre todo enfrentar la hoja en blanco).
2. Muestra el **delta de XP**, el cinturón, la racha y la ronda del torneo.
3. Cierra con **una sola** acción concreta para mañana (principio 5).
4. Si el día fue flojo, narra honesto pero sin vergüenza: la racha y el torneo siguen ahí.

---

## 9. CÓMO SE GUARDA (en `PROGRESO.md`)

El coach mantiene en `PROGRESO.md` de cada asignatura: XP total y cinturón, rango de partida y
nota actual en frío, racha (rejilla), bracket, medallas, barras de cobertura y de accuracy por
bloque/tipo. Se actualiza **en cada `log`**. El formato concreto está en la plantilla
`cuatrimestres/_TEMPLATE_CUATRIMESTRE/asignaturas/_TEMPLATE_ASIGNATURA/PROGRESO.md`.
