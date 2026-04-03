#!/bin/bash

# =============================================================================
# opencode-agents setup script
# 
# Quick setup for your personal AI coding assistant with custom agents
# Supports: Linux, macOS, Windows (WSL/Git Bash)
# =============================================================================

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Emoji
CHECK="${GREEN}✓${NC}"
CROSS="${RED}✗${NC}"
INFO="${BLUE}ℹ${NC}"

# Paths
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OPENCODE_CONFIG_DIR="${HOME}/.config/opencode"
OPENCODE_AGENTS_DIR="${OPENCODE_CONFIG_DIR}/agents"

# =============================================================================
# Helper Functions
# =============================================================================

log_info() {
    echo -e "${INFO} $1"
}

log_success() {
    echo -e "${CHECK} $1"
}

log_error() {
    echo -e "${CROSS} $1"
}

log_warn() {
    echo -e "${YELLOW}⚠ $1${NC}"
}

banner() {
    echo ""
    echo -e "${BLUE}╔══════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║                                                          ║${NC}"
    echo -e "${BLUE}║          opencode-agents setup                           ║${NC}"
    echo -e "${BLUE}║          Your personal AI dev assistant setup            ║${NC}"
    echo -e "${BLUE}║                                                          ║${NC}"
    echo -e "${BLUE}╚══════════════════════════════════════════════════════════╝${NC}"
    echo ""
}

# =============================================================================
# OpenCode Installation
# =============================================================================

install_opencode() {
    log_info "Checking for OpenCode CLI..."
    
    # Check if already installed
    if command -v opencode &> /dev/null; then
        log_success "OpenCode CLI found"
        opencode --version 2>/dev/null || true
        return 0
    fi
    
    log_warn "OpenCode CLI not found!"
    echo ""
    echo "Installing OpenCode CLI..."
    echo ""
    
    # Try official installer first
    curl -fsSL https://opencode.ai/install | sh
    
    # Source shell config to get the new PATH
    if [ -f "${HOME}/.bashrc" ]; then
        source "${HOME}/.bashrc"
    fi
    if [ -f "${HOME}/.zshrc" ]; then
        source "${HOME}/.zshrc"
    fi
    
    # Check if installation succeeded
    if command -v opencode &> /dev/null; then
        log_success "OpenCode CLI installed successfully"
        opencode --version 2>/dev/null || true
    else
        log_error "Failed to install OpenCode CLI"
        echo ""
        echo "Please install manually:"
        echo "  curl -fsSL https://opencode.ai/install | sh"
        echo ""
        exit 1
    fi
}

# =============================================================================
# Git Check
# =============================================================================

check_git() {
    if command -v git &> /dev/null; then
        log_success "git found"
    else
        log_error "git is required but not found"
        echo "Install git: https://git-scm.com/downloads"
        exit 1
    fi
}

# =============================================================================
# Installation Functions
# =============================================================================

install_config() {
    log_info "Setting up OpenCode configuration..."
    
    # Create config directory
    mkdir -p "${OPENCODE_CONFIG_DIR}"
    
    # Backup existing config
    if [ -f "${OPENCODE_CONFIG_DIR}/opencode.json" ]; then
        cp "${OPENCODE_CONFIG_DIR}/opencode.json" "${OPENCODE_CONFIG_DIR}/opencode.json.backup"
        log_info "Backed up existing config"
    fi
    
    # Copy new config with all agents
    if [ -f "${SCRIPT_DIR}/config/opencode.json" ]; then
        cp "${SCRIPT_DIR}/config/opencode.json" "${OPENCODE_CONFIG_DIR}/opencode.json"
        log_success "Config installed with all 10 agents"
    else
        log_error "Config file not found!"
        exit 1
    fi
}

install_agents() {
    log_info "Setting up agent files..."
    
    # Create agents directory
    mkdir -p "${OPENCODE_AGENTS_DIR}"
    
    # Copy master-dev agent
    if [ -f "${SCRIPT_DIR}/agents/master-dev.md" ]; then
        cp "${SCRIPT_DIR}/agents/master-dev.md" "${OPENCODE_AGENTS_DIR}/"
        log_success "master-dev agent installed"
    fi
    
    # Copy dev-team agents
    if [ -d "${SCRIPT_DIR}/agents/dev-team" ]; then
        cp "${SCRIPT_DIR}/agents/dev-team/"*.md "${OPENCODE_AGENTS_DIR}/"
        log_success "Dev team agents installed"
    fi
    
    # List all installed agents
    echo ""
    log_info "Installed agents:"
    echo ""
    local count=0
    for agent in orchestrator master-dev architect frontend-dev backend-dev devops qa-tester researcher security-dev docs-writer; do
        if [ -f "${OPENCODE_AGENTS_DIR}/${agent}.md" ] || [ -f "${OPENCODE_AGENTS_DIR}/${agent}.md" ]; then
            echo -e "    ${GREEN}✓${NC} ${agent}"
            ((count++))
        fi
    done
    echo ""
    log_success "${count} agents ready"
}

install_agents_md() {
    log_info "Installing AGENTS.md guidelines..."
    
    if [ -f "${SCRIPT_DIR}/templates/AGENTS.md" ]; then
        cp "${SCRIPT_DIR}/templates/AGENTS.md" "${OPENCODE_CONFIG_DIR}/AGENTS.md"
        log_success "AGENTS.md installed"
    fi
}

# =============================================================================
# Verification
# =============================================================================

verify_installation() {
    echo ""
    log_info "Verifying installation..."
    echo ""
    
    local errors=0
    
    # Check config
    echo -n "  Config: "
    if [ -f "${OPENCODE_CONFIG_DIR}/opencode.json" ]; then
        agent_count=$(grep -c '"description"' "${OPENCODE_CONFIG_DIR}/opencode.json" || echo "0")
        echo -e "${GREEN}✓${NC} (${agent_count} agents configured)"
    else
        echo -e "${RED}✗${NC}"
        ((errors++))
    fi
    
    # Check agents directory
    echo -n "  Agents: "
    if [ -d "${OPENCODE_AGENTS_DIR}" ]; then
        file_count=$(find "${OPENCODE_AGENTS_DIR}" -name "*.md" 2>/dev/null | wc -l)
        echo -e "${GREEN}✓${NC} (${file_count} agent files)"
    else
        echo -e "${RED}✗${NC}"
        ((errors++))
    fi
    
    # Check AGENTS.md
    echo -n "  Guidelines: "
    if [ -f "${OPENCODE_CONFIG_DIR}/AGENTS.md" ]; then
        echo -e "${GREEN}✓${NC}"
    else
        echo -e "${YELLOW}⚠${NC} (optional)"
    fi
    
    echo ""
    if [ $errors -eq 0 ]; then
        log_success "Installation complete!"
    else
        log_error "Installation completed with ${errors} error(s)"
    fi
}

# =============================================================================
# Post-Install Info
# =============================================================================

show_post_install() {
    echo ""
    echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
    echo -e "${BLUE}                    READY TO GO!                            ${NC}"
    echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
    echo ""
    echo "  Start your AI dev team:"
    echo ""
    echo -e "    ${GREEN}opencode --agent orchestrator${NC}"
    echo ""
    echo "  Or just:"
    echo ""
    echo -e "    ${GREEN}opencode${NC}"
    echo ""
    echo "  Press ${YELLOW}TAB${NC} in opencode to switch between agents."
    echo ""
    echo "  Available agents:"
    echo "    • orchestrator (main contact)"
    echo "    • master-dev (universal developer)"
    echo "    • architect, frontend-dev, backend-dev"
    echo "    • devops, qa-tester, researcher"
    echo "    • security-dev, docs-writer"
    echo ""
    echo "  Locations:"
    echo "    • Config: ${OPENCODE_CONFIG_DIR}/"
    echo "    • Agents: ${OPENCODE_AGENTS_DIR}/"
    echo ""
    echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
    echo ""
}

# =============================================================================
# Main
# =============================================================================

main() {
    banner
    
    check_git
    echo ""
    
    install_opencode
    echo ""
    
    install_config
    echo ""
    
    install_agents
    echo ""
    
    install_agents_md
    echo ""
    
    verify_installation
    show_post_install
}

# Run
main "$@"
