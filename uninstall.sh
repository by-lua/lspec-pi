#!/usr/bin/env bash
# LSpec PI — Desinstalar
# Método recomendado: pi uninstall npm:@by-lua/lspec-pi

set -euo pipefail

PI_SKILLS_DIR="$HOME/.pi/agent/skills"
find "$PI_SKILLS_DIR" -maxdepth 1 -type d -name 'lspec*' -exec rm -rf {} + 2>/dev/null || true

echo ""
echo "lspec-pi removido (skills locais)."

# Se instalado via npm, usar:
echo "Para remover completamente: pi uninstall npm:@by-lua/lspec-pi"
echo ""