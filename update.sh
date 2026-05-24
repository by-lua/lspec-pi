#!/usr/bin/env bash
# L-Spec — Atualizador (desinstala tudo e reinstala limpo)
# Uso: curl -fsSL https://raw.githubusercontent.com/by-lua/lspec-pi/main/update.sh | bash

set -uo pipefail

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

REPO="https://github.com/by-lua/lspec-pi.git"

PI_SKILLS_DIR="$HOME/.pi/agent/skills"
PI_PROMPTS_DIR="$HOME/.pi/agent/prompts"

echo ""
echo -e "${YELLOW}╔════════════════════════════╗${NC}"
echo -e "${YELLOW}║   L-Spec — Atualizando...  ║${NC}"
echo -e "${YELLOW}╚════════════════════════════╝${NC}"
echo ""

# Desinstalar skills l-spec* existentes
echo -e "${BLUE}→ Removendo versão anterior...${NC}"
for skill_dir in "$PI_SKILLS_DIR"/l-spec*/; do
    [[ -d "$skill_dir" ]] || continue
    skill_name=$(basename "$skill_dir")
    rm -rf "$skill_dir"
    echo -e "  ${GREEN}✓${NC} Removido: skills/$skill_name/"
done

# Remover prompts lspec-* existentes
for prompt_file in "$PI_PROMPTS_DIR"/lspec-*.md; do
    [[ -f "$prompt_file" ]] || continue
    prompt_name=$(basename "$prompt_file")
    rm "$prompt_file"
    echo -e "  ${GREEN}✓${NC} Removido: prompts/$prompt_name"
done

# Clonar versão nova
REPO_DIR="$(mktemp -d)"
echo -e "${BLUE}→ Baixando versão nova...${NC}"
git clone --depth 1 "$REPO" "$REPO_DIR" 2>/dev/null || {
    echo -e "${RED}✗ Erro ao clonar. Git instalado?${NC}"; rm -rf "$REPO_DIR"; exit 1; }

mkdir -p "$PI_SKILLS_DIR" "$PI_PROMPTS_DIR"

# Copiar todas as skills
echo -e "${BLUE}→ Instalando skills...${NC}"
skill_count=0
while IFS= read -r skill_file; do
    skill_name=$(basename "$(dirname "$skill_file")")
    mkdir -p "$PI_SKILLS_DIR/$skill_name"
    cp "$skill_file" "$PI_SKILLS_DIR/$skill_name/SKILL.md"
    echo -e "  ${GREEN}✓${NC} skills/$skill_name/SKILL.md"
    ((skill_count++))
done < <(find "$REPO_DIR/skills" -mindepth 2 -name "SKILL.md" -type f)

# Copiar prompts (se existir pasta prompts/)
prompt_count=0
if [[ -d "$REPO_DIR/prompts" ]]; then
    echo -e "${BLUE}→ Instalando atalhos...${NC}"
    while IFS= read -r prompt_file; do
        cp "$prompt_file" "$PI_PROMPTS_DIR/"
        echo -e "  ${GREEN}✓${NC} prompts/$(basename "$prompt_file")"
        ((prompt_count++))
    done < <(find "$REPO_DIR/prompts" -name "lspec-*.md" -type f)
fi

echo ""
echo -e "${GREEN}✓ L-Spec atualizado!${NC} ($skill_count skills, $prompt_count atalhos)"
echo ""
echo "Skills:  /skill:l-spec-discovery | l-spec-feature-clarify | l-spec-specify | l-spec-discuss | l-spec-design | l-spec-tasks | l-spec-execute | l-spec-bugfix | l-spec-ask | l-spec-map | l-spec-pause | l-spec-resume | l-spec-next | l-spec-auto | l-spec-help"
echo "Hub:     /skill:l-spec (overview, auto-sizing, directory structure, rules)"
echo ""

rm -rf "$REPO_DIR"