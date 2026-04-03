#!/bin/bash

# =============================================================================
# reset.sh - Reset opencode agents to defaults
# =============================================================================

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

OPENCODE_CONFIG_DIR="${HOME}/.config/opencode"
OPENCODE_AGENTS_DIR="${OPENCODE_CONFIG_DIR}/agents"

echo -e "${BLUE}╔══════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║              opencode-agents - Reset                      ║${NC}"
echo -e "${BLUE}╚══════════════════════════════════════════════════════════╝${NC}"
echo ""

echo -e "${YELLOW}⚠ This will remove all custom agents and config!${NC}"
echo ""
read -p "Continue? (y/N) " -n 1 -r
echo

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Cancelled."
    exit 0
fi

echo ""
echo "Removing agents..."
rm -rf "${OPENCODE_AGENTS_DIR}"/*.md 2>/dev/null || true
echo -e "${GREEN}✓${NC} Agents removed"

echo "Removing config..."
rm -f "${OPENCODE_CONFIG_DIR}/opencode.json" 2>/dev/null || true
echo -e "${GREEN}✓${NC} Config removed"

echo "Removing AGENTS.md..."
rm -f "${OPENCODE_CONFIG_DIR}/AGENTS.md" 2>/dev/null || true
echo -e "${GREEN}✓${NC} AGENTS.md removed"

echo ""
echo -e "${GREEN}✓${NC} Reset complete!"
echo ""
echo "Run setup.sh again to reinstall."
