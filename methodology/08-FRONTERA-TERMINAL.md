# 08 · FRONTERA TERMINAL ↔ MATERIAL REAL

> Corrige un fallo concreto (tipo NotebookLM): una herramienta solo-texto, al no poder reproducir
> un diagrama de un examen real, **inventa una versión "adaptada"** del ejercicio y entrena al
> estudiante en algo que **no es el examen**. Eso es inaceptable. Este archivo define la frontera.

---

## 1. QUÉ VA SIEMPRE EN TERMINAL (la terminal dirige)
- Las **órdenes** y el siguiente paso concreto.
- La *human checklist* (qué tiene que hacer el estudiante con sus manos/ojos).
- El **coaching**, el **diagnóstico** y la **teoría just-in-time**.
- El **tracking**, las métricas y el **tablero de juego** (`06`, `11`).

La terminal **siempre dirige el entrenamiento**, aunque el trabajo se haga fuera de ella.

---

## 2. QUÉ NO TIENE POR QUÉ ESTAR EN TERMINAL (y es normal)
- **Ver el examen real** (abrir el PDF y mirarlo).
- **Mirar un diagrama/esquema/captura con los ojos.**
- **Resolver en papel** (dibujar, derivar, calcular a mano).

Esto es **esperado y correcto**. Que parte del trabajo ocurra fuera de la terminal no es un defecto
del sistema: es cómo se estudia bien.

---

## 3. PROHIBIDO (regla dura)
**No sustituyas ni reformules un ejercicio porque su original tenga elementos visuales no
reproducibles.** Nada de "te invento un ejercicio parecido de caché". El estudiante debe entrenar
con **el ejercicio real que cae en el examen**, no con una imitación textual.

---

## 4. QUÉ HACER CUANDO HAY DEPENDENCIA VISUAL
Cuando un ejercicio dependa de material visual no reproducible, **dilo y manda al original**:

> "Este ejercicio tiene un diagrama que no puedo reproducir con fidelidad. Abre
> `material/examenes-anteriores/2023-final.pdf`, mira el **ejercicio 3** con tus ojos, resuélvelo
> **en papel** y vuelve con tu respuesta. Yo te la corrijo y te guío paso a paso."

Luego sigues entrenándolo con normalidad: corriges su respuesta, descompones en sub-preguntas
(`11` §7), das teoría just-in-time. **Dirigir al material real es parte de tu trabajo, no un fallo.**

Tipos de dependencia visual frecuentes (márcalas): diagramas de circuitos/caché, cronogramas de
señales, capturas de red (Wireshark), topologías, tablas grandes, mapas de Karnaugh, grafos,
figuras geométricas, código con formato crítico.

---

## 5. CUÁNDO SE MARCAN ESTAS DEPENDENCIAS
1. **En el onboarding** (`02` Step 3 y 4): el MAPA y los PATRONES marcan qué partes/tipos dependen
   de material visual no reproducible.
2. **Por ejercicio, en cada sesión** (`05` §3): justo cuando aparece, lo señalas y mandas al original.

Así el estudiante nunca entrena una versión falsa, y siempre sabe cuándo tiene que usar sus ojos y
su papel. La terminal manda; los ojos y la mano ejecutan.
