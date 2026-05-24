#!/usr/bin/env bash
# L-Spec — Desinstalador
# Uso: curl -fsSL https://raw.githubusercontent.com/by-lua/lspec-pi/main/uninstall.sh | bash

set -uo pipefail

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

PI_SKILLS_DIR="$HOME/.pi/agent/skills"
PI_PROMPTS_DIR="$HOME/.pi/agent/prompts"

echo ""
echo -e "${YELLOW}Desinstalando L-Spec...${NC}"

# Remover todas as skills l-spec*
for skill_dir in "$PI_SKILLS_DIR"/l-spec*/; do
    [[ -d "$skill_dir" ]] || continue
    skill_name=$(basename "$skill_dir")
    rm -rf "$skill_dir"
    echo -e "  ${GREEN}✓${NC} Removido: skills/$skill_name/"
done

# Remover todos os prompts lspec-*
for prompt_file in "$PI_PROMPTS_DIR"/lspec-*.md; do
    [[ -f "$prompt_file" ]] || continue
    prompt_name=$(basename "$prompt_file")
    rm "$prompt_file"
    echo -e "  ${GREEN}✓${NC} Removido: prompts/$prompt_name"
done

echo ""
echo -e "${GREEN}✓ L-Spec desinstalado.${NC}"
echo ""