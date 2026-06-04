#!/usr/bin/env bash
# LSpec PI V2 — Instalador
set -uo pipefail

GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

REPO="https://github.com/by-lua/lspec-pi.git"
PI_SKILLS_DIR="$HOME/.pi/agent/skills"

echo ""
echo -e "${BLUE}╔═══════════════════════════╗${NC}"
echo -e "${BLUE}║    LSpec PI — Install     ║${NC}"
echo -e "${BLUE}╚═══════════════════════════╝${NC}"
echo ""

REPO_DIR="$(mktemp -d)"
echo -e "${BLUE}→ Baixando repositório...${NC}"
git clone --depth 1 "$REPO" "$REPO_DIR" 2>/dev/null || {
  echo -e "${RED}✗ Erro ao clonar repositório${NC}"; rm -rf "$REPO_DIR"; exit 1; }

mkdir -p "$PI_SKILLS_DIR"

echo -e "${BLUE}→ Instalando skills...${NC}"
skill_count=0
while IFS= read -r skill_file; do
  skill_name="$(basename "$(dirname "$skill_file")")"
  rm -rf "$PI_SKILLS_DIR/$skill_name"
  mkdir -p "$PI_SKILLS_DIR/$skill_name"

  # Copia SKILL.md + arquivos auxiliares (references/, assets/, etc)
  cp -R "$(dirname "$skill_file")"/* "$PI_SKILLS_DIR/$skill_name/" 2>/dev/null || true

  echo -e "  ${GREEN}✓${NC} skills/$skill_name"
  ((skill_count++))
done < <(find "$REPO_DIR/skills" -mindepth 2 -maxdepth 2 -name "SKILL.md" -type f)

echo ""
echo -e "${GREEN}✓ LSpec instalado!${NC} ($skill_count skills)"
echo "Comandos: /skill:lspec | /skill:lspec-discovery | /skill:lspec-specify | /skill:lspec-design | /skill:lspec-tasks | /skill:lspec-execute | /skill:lspec-ask | /skill:lspec-pause | /skill:lspec-resume | /skill:lspec-help"
echo ""

rm -rf "$REPO_DIR"
