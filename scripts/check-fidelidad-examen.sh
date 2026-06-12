#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

require() {
  local file="$1"
  local text="$2"

  if ! grep -Fq "$text" "$file"; then
    printf 'FALLO: falta la barrera requerida en %s:\n  %s\n' "$file" "$text" >&2
    exit 1
  fi
}

# Falla si una jerga/cringe prohibida aparece en los archivos del SISTEMA
# (el perfil privado en perfil/ queda fuera: ahí sí pueden vivir las referencias personales).
forbid() {
  local pattern="$1"
  local hits
  if hits=$(grep -rniE "$pattern" methodology/ cuatrimestres/ CLAUDE.md AGENTS.md .agents/ .claude/commands/ 2>/dev/null); then
    printf 'FALLO: jerga/tono cringe en archivos del sistema (debe ir, si acaso, solo en perfil/ privado):\n%s\n' "$hits" >&2
    exit 1
  fi
}

require methodology/00-MANIFEST.md 'OBLIGATORIO antes de plantear un ejercicio'
require methodology/00-MANIFEST.md 'Ejercicio visual = original obligatorio'
require methodology/05-SESION.md 'Prohibido plantear,'
require methodology/05-SESION.md 'ORIGINAL-FRÍO'
require methodology/06-TRACKING-Y-LOGS.md 'reclasifícalo como `PREINTERPRETADO`'
require methodology/08-FRONTERA-TERMINAL.md 'Sin original abierto, se para el ejercicio visual.'
require methodology/08-FRONTERA-TERMINAL.md 'nunca se plantea ni se reproduce'
require methodology/08-FRONTERA-TERMINAL.md 'Comprensión textual del enunciado'
require methodology/08-FRONTERA-TERMINAL.md 'Comprensión visual/notacional'
require methodology/08-FRONTERA-TERMINAL.md 'No avances de puerta mientras la anterior siga rota.'
require methodology/08-FRONTERA-TERMINAL.md 'no lo copia, resume, simplifica, reordena ni parafrasea'
require methodology/05-SESION.md 'No copies, resumas,'
require methodology/11-GAMIFICACION.md 'solo suben con `ORIGINAL-FRÍO`'
require .agents/skills/sesion/SKILL.md 'nunca lo plantees por terminal'
require .claude/commands/kaicho/sesion.md 'nunca lo plantees por terminal'
require AGENTS.md 'Ejercicio visual = original obligatorio'
require CLAUDE.md 'Ejercicio visual = original obligatorio'
require cuatrimestres/_TEMPLATE_CUATRIMESTRE/asignaturas/_TEMPLATE_ASIGNATURA/MAPA-ASIGNATURA.md \
  'nunca plantea el ejercicio por terminal'

# --- Trabajo efectivo > silla, cuota, disciplina e imposición (rediseño 2026-06) ---
require methodology/00-MANIFEST.md 'trabajo efectivo'
require methodology/00-MANIFEST.md 'escalera de disciplina'
require methodology/05-SESION.md 'bitácora de tiempo'
require methodology/05-SESION.md 'CUOTA DE TRABAJO DEL DÍA'
require methodology/05-SESION.md 'ESCALERA DE DISCIPLINA'
require methodology/05-SESION.md 'tiempo muerto'
require methodology/06-TRACKING-Y-LOGS.md 'Trabajo efectivo'
require methodology/06-TRACKING-Y-LOGS.md 'tiempo muerto'
require methodology/11-GAMIFICACION.md 'cuota de trabajo'
require methodology/10-PSICOLOGIA-Y-MENTALIDAD.md 'nunca contra su valía como persona'
require cuatrimestres/_TEMPLATE_CUATRIMESTRE/ROADMAP.md 'Objetivo de trabajo'
require cuatrimestres/_TEMPLATE_CUATRIMESTRE/PROGRESO.md 'Trabajo efectivo'
require cuatrimestres/_TEMPLATE_CUATRIMESTRE/PROGRESO.md 'Órdenes / disciplina activas'
require CLAUDE.md 'trabajo efectivo'
require AGENTS.md 'trabajo efectivo'
require .agents/skills/sesion/SKILL.md 'bitácora de tiempo'
require .agents/skills/fin/SKILL.md 'efectivo'
require .claude/commands/kaicho/sesion.md 'bitácora de tiempo'
require .claude/commands/kaicho/fin.md 'efectivo'
require .claude/settings.json 'UserPromptSubmit'

# --- Regla de los 2 exámenes, rotación multi-asignatura y control por ítem (rediseño v3 2026-06) ---
require methodology/00-MANIFEST.md 'Regla de los 2 exámenes'
require methodology/00-MANIFEST.md 'Ningún día mono-asignatura'
require methodology/00-MANIFEST.md 'TIMEOUT'
require methodology/04-PLANIFICACION.md 'Regla de los 2 exámenes'
require methodology/04-PLANIFICACION.md 'Rotación obligatoria'
require methodology/04-PLANIFICACION.md 'Suelo intocable'
require methodology/05-SESION.md 'CONTRATO DEL DÍA'
require methodology/05-SESION.md 'CONTROL POR ÍTEM'
require methodology/05-SESION.md 'TIMEOUT'
require methodology/05-SESION.md 'mantenimientos primero, bloque principal después'
require methodology/06-TRACKING-Y-LOGS.md 'Bitácora de ítems'
require methodology/06-TRACKING-Y-LOGS.md 'Día completo'
require methodology/06-TRACKING-Y-LOGS.md 'Regla de los 2 exámenes y rotación'
require methodology/07-RECOPILACION-MATERIAL.md 'examen B compuesto'
require methodology/08-FRONTERA-TERMINAL.md 'BANCO DE EXÁMENES'
require methodology/08-FRONTERA-TERMINAL.md 'REPASADO-FRÍO'
require methodology/08-FRONTERA-TERMINAL.md 'DOMINADO'
require methodology/11-GAMIFICACION.md 'Día completo'
require methodology/11-GAMIFICACION.md 'DOMINADO'
require cuatrimestres/_TEMPLATE_CUATRIMESTRE/ROADMAP.md 'Banco de exámenes'
require cuatrimestres/_TEMPLATE_CUATRIMESTRE/ROADMAP.md 'Mantenimiento'
require cuatrimestres/_TEMPLATE_CUATRIMESTRE/ROADMAP.md 'Objetivo de trabajo'
require cuatrimestres/_TEMPLATE_CUATRIMESTRE/PROGRESO.md 'Regla de los 2 exámenes'
require cuatrimestres/_TEMPLATE_CUATRIMESTRE/PROGRESO.md 'Rotación'
require cuatrimestres/_TEMPLATE_CUATRIMESTRE/asignaturas/_TEMPLATE_ASIGNATURA/EXAMEN-PATRONES.md 'Banco de exámenes'
require cuatrimestres/_TEMPLATE_CUATRIMESTRE/asignaturas/_TEMPLATE_ASIGNATURA/EXAMEN-PATRONES.md 'Ritmo del examen real'
require CLAUDE.md 'Regla de los 2 exámenes'
require CLAUDE.md 'TIMEOUT'
require AGENTS.md 'Regla de los 2 exámenes'
require AGENTS.md 'TIMEOUT'
require .claude/commands/kaicho/sesion.md 'CONTRATO DEL DÍA'
require .agents/skills/sesion/SKILL.md 'CONTRATO DEL DÍA'
require .claude/commands/kaicho/fin.md 'bloque a bloque'
require .agents/skills/fin/SKILL.md 'bloque a bloque'
require .claude/commands/kaicho/recalibrar.md 'Suelo'
require .agents/skills/recalibrar/SKILL.md 'Suelo'

# --- Tono sobrio: que la jerga/cringe no se cuele en el sistema (sí puede ir en perfil/ privado) ---
forbid 'stay hard|cargar los botes|carry the boats|gold-window|🪖|sargento'

printf 'OK: barreras de fidelidad, trabajo efectivo, disciplina y tono sobrio presentes.\n'
