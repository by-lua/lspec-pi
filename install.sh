#!/usr/bin/env bash
# L-Spec — Instalador / Atualizador
# Uso: curl -fsSL https://raw.githubusercontent.com/by-lua/lspec-pi/main/install.sh | bash

set -uo pipefail

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

REPO="https://github.com/by-lua/lspec-pi.git"

PI_SKILLS_DIR="$HOME/.pi/agent/skills"
PI_PROMPTS_DIR="$HOME/.pi/agent/prompts"

# Detectar instalação existente
if [[ -f "$PI_SKILLS_DIR/l-spec/SKILL.md" ]]; then
    ACTION="update"
    echo ""
    echo -e "${YELLOW}╔════════════════════════════╗${NC}"
    echo -e "${YELLOW}║   L-Spec — Atualizando... ║${NC}"
    echo -e "${YELLOW}╚════════════════════════════╝${NC}"
else
    ACTION="install"
    echo ""
    echo -e "${BLUE}╔═══════════════════════════╗${NC}"
    echo -e "${BLUE}║   L-Spec — Instalador    ║${NC}"
    echo -e "${BLUE}╚═══════════════════════════╝${NC}"
fi
echo ""

# Sempre clona (via curl | bash não tem BASH_SOURCE)
REPO_DIR="$(mktemp -d)"
echo -e "${BLUE}→ Baixando repositório...${NC}"
git clone --depth 1 "$REPO" "$REPO_DIR" 2>/dev/null || {
    echo -e "${RED}✗ Erro ao clonar. Git instalado?${NC}"; rm -rf "$REPO_DIR"; exit 1; }

mkdir -p "$PI_SKILLS_DIR" "$PI_PROMPTS_DIR"

# Skill L-Spec
echo -e "${BLUE}→ Instalando skill L-Spec...${NC}"
mkdir -p "$PI_SKILLS_DIR/l-spec"
cp "$REPO_DIR/skills/l-spec/SKILL.md" "$PI_SKILLS_DIR/l-spec/SKILL.md"
echo -e "  ${GREEN}✓${NC} skills/l-spec/SKILL.md"

# Prompts
echo -e "${BLUE}→ Instalando comandos slash...${NC}"
count=0
for f in "$REPO_DIR/prompts/"/lspec-*.md; do
    [[ -f "$f" ]] || continue
    cp "$f" "$PI_PROMPTS_DIR/"
    echo -e "  ${GREEN}✓${NC} prompts/$(basename "$f")"
    ((count++))
done

echo ""
if [[ "$ACTION" == "update" ]]; then
    echo -e "${GREEN}✓ L-Spec atualizado!${NC} (${count} comandos)"
else
    echo -e "${GREEN}✓ L-Spec instalado!${NC} (${count} comandos)"
fi
echo ""
echo "Comandos: /lspec discovery | feature-clarify | specify | discuss | design | tasks | execute | bugfix | ask | map | pause | resume | next | auto | help"
echo ""

rm -rf "$REPO_DIR"