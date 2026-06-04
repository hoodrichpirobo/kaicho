<div align="center">

# 會長 · Kaichō

**Sistema de _context engineering_ que convierte a un agente de código (Claude Code · Codex) en un coach de estudio para exámenes: determinista, agnóstico de herramienta y guiado por evidencia.**

[![Licencia MIT](https://img.shields.io/badge/licencia-MIT-blue.svg)](LICENSE)
[![Claude Code](https://img.shields.io/badge/Claude_Code-compatible-D97757?logo=anthropic&logoColor=white)](#funcionamiento)
[![Codex](https://img.shields.io/badge/Codex-compatible-412991?logo=openai&logoColor=white)](#funcionamiento)
[![Idioma español](https://img.shields.io/badge/idioma-español-c60b1e.svg)](#)
[![Dependencias cero](https://img.shields.io/badge/dependencias-0-2ea44f.svg)](#)
[![Pedagogía: Make It Stick](https://img.shields.io/badge/pedagogía-evidence--based-e67e22.svg)](#pedagogía-basada-en-evidencia)

</div>

Kaichō no es un *prompt* ni un chatbot de dudas. Es una **plantilla de políticas y contexto**
—archivos Markdown versionados— que especifican el comportamiento de un agente de código para que
actúe como entrenador de exámenes: fuerza recuperación activa, planifica en orden inverso desde el
examen real y hace el progreso medible. Sin servidor, sin *fine-tuning*, sin dependencias: solo
contexto bien diseñado.

---

## Índice

- [Por qué existe](#por-qué-existe)
- [Tesis de diseño](#tesis-de-diseño)
- [Funcionamiento](#funcionamiento)
- [Comportamiento del agente: traza de una sesión](#comportamiento-del-agente-traza-de-una-sesión)
- [Pedagogía basada en evidencia](#pedagogía-basada-en-evidencia)
- [Gatillos](#gatillos)
- [Gamificación como restricción de diseño](#gamificación-como-restricción-de-diseño)
- [Inicio rápido](#inicio-rápido)
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

Las decisiones de ingeniería que sostienen el sistema:

| Principio | Decisión |
|---|---|
| **Fuente única de verdad** | Toda la lógica vive en `methodology/*.md` (00–11). Los bootstraps no la duplican; la referencian. |
| **Agnóstico de herramienta** | El comportamiento no depende del *runtime*. Mismo contexto para Claude Code y Codex. |
| **Activación determinista entre agentes** | Los gatillos se definen como **frases en lenguaje natural** en los bootstraps que ambos agentes cargan siempre (`CLAUDE.md` / `AGENTS.md`), en lugar de *slash-commands* específicos de cada herramienta —que no tienen paridad—. Reproducible con independencia del agente. |
| **Separación plantilla / instancia** | El repo público es la plantilla. Los datos personales y el material de la asignatura viven en una instancia local, nunca versionada. |
| **Privacidad por defecto** | El `.gitignore` excluye perfil y material; lo personal no puede filtrarse a la rama pública por descuido. |
| **Anti-alucinación de contenido** | Frontera explícita terminal ↔ material real: ante un ejercicio con dependencia visual (diagramas, capturas), el agente **redirige al original** en vez de inventar una versión "equivalente". |
| **Pedagogía basada en evidencia** | Las políticas se derivan de literatura de ciencia del aprendizaje, no de intuición (ver más abajo). |

## Funcionamiento

Tres capas, una sola fuente de verdad:

```text
┌─ Bootstraps (finos, < 32 KiB) ──────────────────────────────────────────────┐
│   CLAUDE.md   (Claude Code lo lee)        AGENTS.md   (Codex lo lee, auto)    │
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
implementaciones. Como conveniencia opcional, los gatillos existen además como *slash-commands*
en `.claude/commands/` y como *Agent Skills* en `.agents/skills/`, pero el sistema no depende de ellos.

## Comportamiento del agente: traza de una sesión

El diseño del bucle de sesión, ilustrado. La primera sesión de una asignatura es un examen en frío
(diagnóstico), no una clase:

```text
$ sesion algoritmos

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
   (repetición espaciada). Escribe `log` para cerrar.

$ log

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

La consecuencia de diseño: el sistema **mide conocimiento real** (accuracy en ejercicios tipo), no la
sensación de haber estudiado.

## Gatillos

Idénticos en Claude Code y Codex. El agente reconoce variantes y sinónimos.

| Gatillo | Función |
|---|---|
| `setup` | Entrevista global (una vez). Construye el perfil. |
| `onboard <asignatura>` | Ingesta de material, mapa de la asignatura, minería de patrones de examen, selección de estrategia y plan inverso. |
| `sesion <asignatura>` | Bucle de estudio activo. |
| `pausa` / `reanudar` | Control del cronómetro (el tiempo en pausa no computa como estudio). |
| `log` | Cierre: registro fechado, actualización de métricas y estado de juego. |
| `recalibrar` | Replanificación con el ritmo real medido en los logs. |

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

## Inicio rápido

Con el botón **Use this template** de GitHub, o clonando:

```bash
git clone https://github.com/hoodrichpirobo/kaicho.git
cd kaicho
```

Abre la carpeta con Claude Code o Codex y escribe `setup` (entrevista única; privada). Después, por
asignatura:

```bash
cp -r cuatrimestres/_TEMPLATE_CUATRIMESTRE cuatrimestres/2026-01_a_2026-07
cp -r cuatrimestres/2026-01_a_2026-07/asignaturas/_TEMPLATE_ASIGNATURA \
      cuatrimestres/2026-01_a_2026-07/asignaturas/REDES
# coloca el material (sobre todo exámenes de años anteriores) en sus carpetas, y:
#   onboard REDES   →   sesion REDES   →   log
```

Ciclo operativo: `sesion` → entrenar → `log`; al día siguiente se retoma desde el último log;
`recalibrar` cuando el ritmo real lo exija.

## Privacidad: plantilla vs. instancia

El repositorio público **es la plantilla**, no los datos. El `.gitignore` excluye:

- El perfil del estudiante (`perfil/ESTUDIANTE.md`, `perfil/PSICOLOGIA.md`). Las plantillas
  `_TEMPLATE_*` sí se publican, vacías.
- El trabajo de cada cuatrimestre (`cuatrimestres/*`, salvo la plantilla): incluye material
  universitario con copyright y el progreso personal.

El material de la asignatura y los datos personales **no salen de la máquina local**.

## Estructura del repositorio

```text
kaicho/
├── README.md
├── CLAUDE.md · AGENTS.md         bootstraps (gatillos) para Claude Code y Codex
├── .gitignore                    aísla datos personales y material con copyright
├── methodology/                  00-MANIFEST … 11-GAMIFICACION (12 archivos)
├── .claude/commands/             slash-commands (conveniencia)
├── .agents/skills/               Agent Skills de Codex (conveniencia)
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

**¿Claude Code o Codex?** Cualquiera. El comportamiento es equivalente por diseño.

**¿Sirve para cualquier titulación?** Sí. La metodología es genérica; `onboard` se adapta a cada
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
