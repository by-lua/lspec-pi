#!/usr/bin/env bash
# L-Spec — Desinstalador

set -euo pipefail

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

PI_SKILLS_DIR="$HOME/.pi/agent/skills"
PI_PROMPTS_DIR="$HOME/.pi/agent/prompts"

echo ""
echo -e "${YELLOW}Desinstalando L-Spec...${NC}"

rm -rf "$PI_SKILLS_DIR/l-spec"
echo -e "  ${GREEN}✓${NC} Removido: skills/l-spec/"

for f in "$PI_PROMPTS_DIR"/lspec-*.md; do
    [[ -f "$f" ]] || continue
    rm "$f"
    echo -e "  ${GREEN}✓${NC} Removido: prompts/$(basename "$f")"
done

echo ""
echo -e "${GREEN}✓ L-Spec desinstalado.${NC}"
echo ""