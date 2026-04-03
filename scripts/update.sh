#!/bin/bash

# =============================================================================
# update.sh - Update opencode agents
# =============================================================================

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd ../ && pwd)"
OPENCODE_CONFIG_DIR="${HOME}/.config/opencode"
OPENCODE_AGENTS_DIR="${OPENCODE_CONFIG_DIR}/agents"

echo -e "${BLUE}╔══════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║              opencode-agents - Update                       ║${NC}"
echo -e "${BLUE}╚══════════════════════════════════════════════════════════╝${NC}"
echo ""

# Update from git if available
if [ -d "${SCRIPT_DIR}/.git" ]; then
    echo "Pulling latest changes..."
    cd "${SCRIPT_DIR}"
    git pull 2>/dev/null || echo "Could not pull updates"
    cd - > /dev/null
fi

# Copy agents to config
echo "Updating agents..."
mkdir -p "${OPENCODE_AGENTS_DIR}"
if [ -d "${SCRIPT_DIR}/agents" ]; then
    cp -r "${SCRIPT_DIR}/agents/"* "${OPENCODE_AGENTS_DIR}/"
    echo -e "${GREEN}✓${NC} Agents updated"
fi

# Update config if changed
if [ -f "${SCRIPT_DIR}/config/opencode.json" ]; then
    cp "${SCRIPT_DIR}/config/opencode.json" "${OPENCODE_CONFIG_DIR}/opencode.json"
    echo -e "${GREEN}✓${NC} Config updated"
fi

# Update AGENTS.md if changed
if [ -f "${SCRIPT_DIR}/templates/AGENTS.md" ]; then
    cp "${SCRIPT_DIR}/templates/AGENTS.md" "${OPENCODE_CONFIG_DIR}/AGENTS.md"
    echo -e "${GREEN}✓${NC} AGENTS.md updated"
fi

echo ""
echo -e "${GREEN}✓${NC} Update complete!"
