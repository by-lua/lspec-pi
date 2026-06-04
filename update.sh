#!/usr/bin/env bash
set -euo pipefail

PI_SKILLS_DIR="$HOME/.pi/agent/skills"
find "$PI_SKILLS_DIR" -maxdepth 1 -type d -name 'lspec*' -exec rm -rf {} + 2>/dev/null || true
curl -fsSL https://raw.githubusercontent.com/by-lua/lspec-pi/main/install.sh | bash
