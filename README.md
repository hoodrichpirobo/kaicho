<div align="center">

# 會長 · Kaichō

**Sistema de _context engineering_ que convierte a un agente de código (Claude Code · Codex) en un coach de estudio para exámenes: determinista, agnóstico de herramienta y guiado por evidencia.**

[![Licencia MIT](https://img.shields.io/badge/licencia-MIT-blue.svg)](LICENSE)
[![Claude Code](https://img.shields.io/badge/Claude_Code-compatible-D97757?logo=anthropic&logoColor=white)](#comandos)
[![Codex](https://img.shields.io/badge/Codex-compatible-412991?logo=openai&logoColor=white)](#comandos)
[![Idioma español](https://img.shields.io/badge/idioma-español-c60b1e.svg)](#)
[![Dependencias cero](https://img.shields.io/badge/dependencias-0-2ea44f.svg)](#)
[![Pedagogía: Make It Stick](https://img.shields.io/badge/pedagogía-evidence--based-e67e22.svg)](#pedagogía-basada-en-evidencia)

</div>

Kaichō no es un *prompt* ni un chatbot de dudas. Es una **plantilla de políticas y contexto**
—archivos Markdown versionados— que especifican el comportamiento de un agente de código para que
actúe como entrenador de exámenes: fuerza recuperación activa, planifica en orden inverso desde el
examen real y hace el progreso medible. Sin servidor, sin *fine-tuning*, sin dependencias.

---

## Índice

- [Por qué existe](#por-qué-existe)
- [Tesis de diseño](#tesis-de-diseño)
- [Inicio rápido](#inicio-rápido)
- [Flujo diario](#flujo-diario)
- [Comandos](#comandos)
- [Funcionamiento](#funcionamiento)
- [Comportamiento del agente: traza de una sesión](#comportamiento-del-agente-traza-de-una-sesión)
- [Pedagogía basada en evidencia](#pedagogía-basada-en-evidencia)
- [Gamificación como restricción de diseño](#gamificación-como-restricción-de-diseño)
- [Privacidad: plantilla vs. instancia](#privacidad-plantilla-vs-instancia)
- [Estructura del repositorio](#estructura-del-repositorio)
- [Preguntas frecuentes](#preguntas-frecuentes)
- [Extender el sistema](#extender-el-sistema)
- [Créditos y licencia](#créditos-y-licencia)

## Por qué existe

Soy transparente con el origen, porque el diseño se entiende mejor conociéndolo. Rindo por encima de
la media en lo **práctico** —proyectos, trabajo de campo, competición— pero los **exámenes teóricos**
son mi punto flaco: tiendo a posponer, a evitar ponerme a prueba en frío y a caer en estudio pasivo
(releer, subrayar) que da sensación de avance sin retención real.

En lugar de seguir confiando en la fuerza de voluntad —que en ese terreno concreto ya ha demostrado
fallarme— decidí tratar mi propio modo de fallo como un **problema de ingeniería**: un sistema que
corrige el patrón *por construcción*. Kaichō fuerza la recuperación activa antes que cualquier
relectura, ataca el examen real en vez del temario entero y convierte el progreso en algo medible y
visible. Lo publico como plantilla porque el patrón —evitar la práctica que expone debilidad— no es
solo mío.

## Tesis de diseño

| Principio | Decisión |
|---|---|
| **Fuente única de verdad** | Toda la lógica vive en `methodology/*.md` (00–11). Los bootstraps no la duplican; la referencian. |
| **Agnóstico de herramienta** | El comportamiento no depende del *runtime*. Mismo contexto para Claude Code y Codex. |
| **Activación determinista entre agentes** | Los gatillos se definen como **frases en lenguaje natural** en los bootstraps que ambos agentes cargan siempre (`CLAUDE.md` / `AGENTS.md`). Encima, cada agente expone su mecanismo nativo de comandos (ver [Comandos](#comandos)). |
| **Separación plantilla / instancia** | El repo público es la plantilla. Los datos personales y el material de la asignatura viven en una instancia local, nunca versionada. |
| **Privacidad por defecto** | El `.gitignore` excluye perfil y material; lo personal no puede filtrarse a la rama pública por descuido. |
| **Anti-alucinación de contenido** | Frontera explícita terminal ↔ material real: ante un ejercicio con dependencia visual, el agente **redirige al original** en vez de inventar una versión "equivalente". |
| **Pedagogía basada en evidencia** | Las políticas se derivan de literatura de ciencia del aprendizaje, no de intuición. |

## Inicio rápido

```text
1 · Obtén la plantilla
     GitHub → botón "Use this template" → crea tu repo → clónalo
     o:  git clone https://github.com/hoodrichpirobo/kaicho.git && cd kaicho

2 · Abre la carpeta con tu agente
     Claude Code:  claude          Codex:  codex

3 · Configura tu perfil (una vez)
     Claude Code →  /setup
     Codex       →  $setup     (o simplemente escribe:  setup)

4 · Da de alta una asignatura
     # crea las carpetas a partir de las plantillas
     cp -r cuatrimestres/_TEMPLATE_CUATRIMESTRE cuatrimestres/2026-01_a_2026-07
     cp -r cuatrimestres/2026-01_a_2026-07/asignaturas/_TEMPLATE_ASIGNATURA \
           cuatrimestres/2026-01_a_2026-07/asignaturas/REDES
     # coloca el material en material/ y guia-docente/ (sobre todo exámenes de años anteriores)
     Claude Code →  /onboard REDES
     Codex       →  $onboard REDES    (o:  onboard REDES)

5 · Entrena
     Claude Code →  /sesion REDES
     Codex       →  $sesion REDES     (o:  sesion REDES)
```

> El paso 4 está bloqueado por diseño: el agente no genera el plan hasta tener los exámenes de años
> anteriores (o tu confirmación de que no existen). Son la señal de mayor valor.

## Flujo diario

```text
┌─ UNA VEZ ───────────────────────────────────────────────────────────────────┐
│  /setup            entrevista de perfil (global, persiste entre cuatrimestres)│
│  /onboard <asig>   ingesta → mapa → patrones de examen → estrategia → plan    │
└───────────────────────────────────────────────────────────────────────────────┘
                                     │
                                     ▼
┌─ CADA DÍA · un round ────────────────────────────────────────────────────────┐
│  /sesion <asig>                                                               │
│     ├─ arranque en frío: intentas ANTES de leer (1ª sesión = examen completo) │
│     ├─ intento → diagnóstico → teoría just-in-time → recall espaciado         │
│     ├─ /pausa  ·  /reanudar   (el tiempo en pausa no cuenta como estudio)      │
│     └─ /log    registro fechado + XP + tablero + el siguiente paso (uno)       │
└───────────────────────────────────────────────────────────────────────────────┘
                                     │
                 al día siguiente, /sesion retoma desde el último log
                                     │
                   ¿el ritmo real no llega?  →  /recalibrar
```

1. **Empieza el día con `/sesion <asignatura>`.** El agente carga el plan, el progreso y el último
   log, y te pone a producir desde el primer minuto (no a leer). En la primera sesión de una
   asignatura, el arranque es un **examen en frío** que fija tu punto de partida.
2. **Trabaja el round.** Intentas, el agente diagnostica, te da solo la teoría que el ejercicio pide
   y reparte los tipos de problema (intercalado). Lo difícil se parte en sub-preguntas. Usa
   `/pausa` y `/reanudar` para que el cronómetro refleje horas reales.
3. **Cierra con `/log`.** Registra la sesión (horas reales, accuracy, cobertura), actualiza el
   tablero (XP, racha, ronda del torneo) y deja escrito **el único** siguiente paso. Para ahí.
4. **Al día siguiente**, `/sesion` retoma exactamente donde lo dejaste y re-pregunta lo que quedó
   débil (repetición espaciada).
5. **Cuando el ritmo real no cuadre** con la fecha del examen, `/recalibrar` reescribe el plan sobre
   datos —no sobre buenos deseos— y re-prioriza al subconjunto de mayor rendimiento.

## Comandos

Los mismos cinco gatillos, expuestos con el mecanismo **nativo** de cada herramienta. En cualquiera
de los dos, **escribir la frase en lenguaje natural también funciona** — es lo que garantiza la paridad.

| Acción | Claude Code | Codex | Lenguaje natural |
|---|---|---|---|
| Perfil global (una vez) | `/setup` | `$setup` · `/skills` | "empezar", "configúrame" |
| Alta de asignatura | `/onboard <asig>` | `$onboard <asig>` | "da de alta REDES" |
| Round de estudio | `/sesion <asig>` | `$sesion <asig>` | "vamos a entrenar REDES" |
| Pausa / reanudar crono | `/pausa` · `/reanudar` | `$pausa` · `$reanudar` | "para el crono" · "seguimos" |
| Cierre de sesión | `/log` | `$log` | "cierra el round" |
| Replanificar | `/recalibrar` | `$recalibrar` | "voy mal de tiempo" |

**Cómo lo resuelve cada herramienta:**

- **Claude Code** carga `.claude/commands/*.md` como *slash commands* nativos: `/setup`,
  `/onboard REDES`, etc. (con argumentos).
- **Codex** carga `.agents/skills/*/SKILL.md` como *Agent Skills*: se invocan con `$nombre`, desde el
  selector `/skills`, o **automáticamente** cuando escribes el gatillo (cada skill declara en su
  `description` las frases que la activan). Codex no soporta *slash commands* personalizados por
  repositorio; las skills son su mecanismo equivalente y sí viajan con el repo.

## Funcionamiento

Tres capas, una sola fuente de verdad:

```text
┌─ Bootstraps (finos, < 32 KiB) ──────────────────────────────────────────────┐
│   CLAUDE.md  (Claude Code lo lee)        AGENTS.md  (Codex lo lee, automático)│
│   · misma tabla de gatillos en lenguaje natural (verificada idéntica)        │
│   · no contienen lógica: redirigen a ▼                                       │
├─ methodology/ — el "cerebro" (tool-agnóstico) ──────────────────────────────┤
│   00-MANIFEST · 01-SETUP · 02-ONBOARDING · 03-ESTRATEGIAS · 04-PLANIFICACION │
│   05-SESION · 06-TRACKING · 07-RECOPILACION · 08-FRONTERA-TERMINAL ·         │
│   09-MAKE-IT-STICK · 10-PSICOLOGIA · 11-GAMIFICACION                         │
├─ Instancia (local, no versionada) ──────────────────────────────────────────┤
│   perfil/ (perfil global, persiste entre cuatrimestres)                      │
│   cuatrimestres/<cuatri>/asignaturas/<asig>/ (material, plan, progreso, logs)│
└──────────────────────────────────────────────────────────────────────────────┘
```

**Paridad entre agentes.** Codex descubre y lee `AGENTS.md` recorriendo desde la raíz del repo;
Claude Code lee `CLAUDE.md`. Ambos contienen la **misma** especificación de gatillos y apuntan al
mismo `methodology/`. Por eso el sistema se comporta igual en los dos sin mantener dos
implementaciones, e independientemente de qué mecanismo de comandos use cada herramienta.

## Comportamiento del agente: traza de una sesión

La primera sesión de una asignatura es un examen en frío (diagnóstico), no una clase:

```text
$ /sesion algoritmos

Kaichō — Primera sesión de Algoritmos. Hoy no estudiamos: medimos el punto de partida.
   Examen real de 2022, en frío: sin apuntes, sin pistas, 50 min. La nota de hoy es un
   diagnóstico, no un veredicto. Arranca el crono.

   ── 50 min después ──

tú — hecho. mal, un 3 o así.

Kaichō — Un 3 en frío es exactamente la señal que buscábamos: el mapa de los huecos.
   Rango de partida: 3/10. +100 XP por completar la prueba en frío.
   Los tres fallos son de quicksort, el tipo que aparece en 9 de 10 exámenes. Empezamos por ahí.

tú — vale, pero déjame releer la teoría primero.

Kaichō — No. "Releer primero" es evitación: produce sensación de avance sin recuperación.
   Lo hacemos al revés —intentas, fallas, y te doy la teoría justo cuando la necesites—.
   En quicksort, ¿qué es el pivote?

tú — el elemento que eliges para particionar.

Kaichō — Correcto. +5. ¿Y el resto de elementos respecto al pivote?

tú — menores a un lado, mayores al otro.

Kaichō — Exacto. +5. Ahora una partición de [5,3,8,1] con pivote 5, en papel. Enséñamela.

   ── la resuelve ──

Kaichō — Correcto, sin pista. +20. Hueco cerrado. Mañana te lo vuelvo a preguntar en frío
   (repetición espaciada). Escribe /log para cerrar.

$ /log

Round cerrado.
   examen en frío completado .............. +100
   partición de quicksort, sin pistas ..... +30
   XP 0 → 130 · nivel ⬜→🟨 · racha 1 día · torneo: Clasificatorios → Octavos
   Siguiente: recall de quicksort en frío + coste asintótico.
```

El sistema nombra la evitación cuando aparece y la reconduce a práctica activa: ese es el
comportamiento que separa a Kaichō de un tutor que simplemente responde.

## Pedagogía basada en evidencia

Las políticas del agente se derivan de **_Make It Stick: The Science of Successful Learning_**
(Brown, Roediger, McDaniel). El agente las aplica y, progresivamente, las explica al estudiante:

- **Práctica de recuperación** (*testing effect*): recuperar consolida; releer no.
- **Práctica espaciada e intercalada**: volver tras un intervalo y mezclar tipos de problema.
- **Dificultades deseables**: el esfuerzo que cuesta es el que produce aprendizaje duradero.
- **Calibración / ilusión de fluidez**: la familiaridad no es dominio; se mide con desempeño en frío.
- **Inexistencia de "estilos de aprendizaje"**: se estudia según lo que exige el examen.

Consecuencia de diseño: el sistema **mide conocimiento real** (accuracy en ejercicios tipo), no la
sensación de haber estudiado.

## Gamificación como restricción de diseño

El estado de progreso (`PROGRESO.md`) se mantiene en texto y se actualiza en cada cierre:

```text
XP 670 · nivel 🟧 · partida 3/10 → actual en frío 6/10

        L  M  X  J  V  S  D
Sem 1   ▰  ▰  ▱  ▰  ▰  ▰  ▱
Sem 2   ▰  ▰  ▰  ▰  ·  ·  ·     racha: 4 días

Clasificatorios ─ Octavos ─[ Cuartos ◀ aquí ]─ Semifinal ─ Final

quicksort  cobertura [████████  ] 80%   accuracy [███████   ] 70%
Dijkstra   cobertura [████      ] 40%   accuracy [███       ] 30%
```

**Restricción de integridad (no negociable):** las recompensas se otorgan **solo por estudio activo
y accuracy** —exámenes en frío, resolver sin pistas, acertar lo que antes se fallaba—. Releer da casi
cero. Gamificar el estudio pasivo reforzaría justo la ilusión de fluidez que el sistema combate; por
eso la métrica de progreso está atada a desempeño verificable, no a tiempo invertido.

## Privacidad: plantilla vs. instancia

El repositorio público **es la plantilla**, no los datos. El `.gitignore` excluye:

- El perfil del estudiante (`perfil/ESTUDIANTE.md`, `perfil/PSICOLOGIA.md`). Las plantillas
  `_TEMPLATE_*` sí se publican, vacías.
- El trabajo de cada cuatrimestre (`cuatrimestres/*`, salvo la plantilla): material universitario con
  copyright y progreso personal.

El material de la asignatura y los datos personales **no salen de la máquina local**.

## Estructura del repositorio

```text
kaicho/
├── README.md
├── CLAUDE.md · AGENTS.md         bootstraps (gatillos) para Claude Code y Codex
├── .gitignore                    aísla datos personales y material con copyright
├── methodology/                  el cerebro: 00-MANIFEST … 11-GAMIFICACION (12 archivos)
├── .claude/commands/             slash commands nativos de Claude Code (/setup, /onboard, …)
├── .agents/skills/               Agent Skills de Codex ($setup, $onboard, …)
├── perfil/                       perfil global (instancia local) + plantillas públicas vacías
└── cuatrimestres/
    └── _TEMPLATE_CUATRIMESTRE/    se copia por cuatrimestre
        ├── CALENDARIO.md · PANORAMA.md
        └── asignaturas/_TEMPLATE_ASIGNATURA/   se copia por asignatura
            ├── guia-docente/ · material/{powerpoints,bibliografia,ejercicios-propuestos,
            │                              practicas-laboratorios,docencia-inversa,examenes-anteriores}/
            ├── MAPA-ASIGNATURA.md · EXAMEN-PATRONES.md · PLAN.md · PROGRESO.md
            └── LOGS/             un log fechado por sesión
```

## Preguntas frecuentes

**¿Requiere asistir a clase?** No. Está diseñado para estudiar con el material que la universidad
publica en línea.

**¿Claude Code o Codex?** Cualquiera. El comportamiento es equivalente por diseño; solo cambia el
mecanismo nativo con que invocas los comandos (ver [Comandos](#comandos)).

**¿Sirve para cualquier titulación?** Sí. La metodología es genérica; `/onboard` se adapta a cada
asignatura a partir de su guía docente y sus exámenes.

**¿Y si no existen exámenes de años anteriores?** El sistema los exige primero (máxima señal). Si no
existen, se confirma explícitamente y se usan ejercicios propuestos y exámenes de muestra como sustituto.

**¿Dependencias, GPU, servicios?** Ninguna. Son archivos Markdown que el agente lee como contexto.

## Extender el sistema

Es una plantilla para usar y adaptar, no un proyecto de colaboración. Haz un *fork*, renómbralo
(`README.md` + directorio), ajusta el tono del coach o añade mecánicas: toda la conducta está en
`methodology/*.md`, en texto plano. *Issues* y *PRs* son bienvenidos, pero el objetivo es que cada
quien lo haga suyo.

## Créditos y licencia

- Estructura inspirada en **[Orchestrator](https://github.com/imadrifai/orchestrator)** (context engineering para agentes de código).
- Pedagogía basada en **_Make It Stick_** (Brown, Roediger, McDaniel).

Licencia **[MIT](LICENSE)** © 2026 CUX "INDIO" PRADA.

---

<div align="center"><sub>Mejor sangrar en el entrenamiento que en el combate.</sub></div>
