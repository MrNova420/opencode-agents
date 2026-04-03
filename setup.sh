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
# Checks
# =============================================================================

check_requirements() {
    log_info "Checking requirements..."
    
    # Check for opencode
    if ! command -v opencode &> /dev/null; then
        log_warn "opencode not found!"
        echo ""
        echo "Please install opencode first:"
        echo "  curl -fsSL https://opencode.ai/install | bash"
        echo ""
        echo "Or: npm install -g opencode-ai"
        echo ""
        read -p "Continue anyway? (y/N) " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            exit 1
        fi
    else
        log_success "opencode found"
        opencode --version 2>/dev/null || true
    fi
    
    # Check for git
    if command -v git &> /dev/null; then
        log_success "git found"
    else
        log_warn "git not found - some features may not work"
    fi
}

# =============================================================================
# Installation
# =============================================================================

install_agents() {
    log_info "Setting up agents directory..."
    
    # Create directories
    mkdir -p "${OPENCODE_AGENTS_DIR}"
    
    # Copy agents
    if [ -d "${SCRIPT_DIR}/agents" ]; then
        cp -r "${SCRIPT_DIR}/agents/"* "${OPENCODE_AGENTS_DIR}/"
        log_success "Agents installed"
    fi
    
    # List installed agents
    echo ""
    log_info "Installed agents:"
    ls -1 "${OPENCODE_AGENTS_DIR}" | while read agent; do
        echo "  • ${agent}"
    done
}

install_config() {
    log_info "Setting up opencode configuration..."
    
    # Create opencode config dir if needed
    mkdir -p "${OPENCODE_CONFIG_DIR}"
    
    # Copy config if exists
    if [ -f "${SCRIPT_DIR}/config/opencode.json" ]; then
        # Backup existing config
        if [ -f "${OPENCODE_CONFIG_DIR}/opencode.json" ]; then
            cp "${OPENCODE_CONFIG_DIR}/opencode.json" "${OPENCODE_CONFIG_DIR}/opencode.json.backup"
            log_info "Backed up existing config"
        fi
        
        cp "${SCRIPT_DIR}/config/opencode.json" "${OPENCODE_CONFIG_DIR}/opencode.json"
        log_success "Config installed"
    fi
}

install_agents_md() {
    log_info "Looking for AGENTS.md to install..."
    
    # Check various locations
    if [ -f "${SCRIPT_DIR}/templates/AGENTS.md" ]; then
        # Check if user wants to install globally
        if [ -f "${OPENCODE_CONFIG_DIR}/AGENTS.md" ]; then
            log_warn "AGENTS.md already exists in config"
            read -p "Overwrite? (y/N) " -n 1 -r
            echo
            if [[ $REPLY =~ ^[Yy]$ ]]; then
                cp "${SCRIPT_DIR}/templates/AGENTS.md" "${OPENCODE_CONFIG_DIR}/AGENTS.md"
                log_success "AGENTS.md installed to ~/.config/opencode/"
            else
                log_info "Skipped AGENTS.md installation"
            fi
        else
            cp "${SCRIPT_DIR}/templates/AGENTS.md" "${OPENCODE_CONFIG_DIR}/AGENTS.md"
            log_success "AGENTS.md installed to ~/.config/opencode/"
        fi
    fi
}

# =============================================================================
# Verification
# =============================================================================

verify_installation() {
    echo ""
    log_info "Verifying installation..."
    
    local errors=0
    
    # Check agents
    if [ -d "${OPENCODE_AGENTS_DIR}" ]; then
        agent_count=$(ls -1 "${OPENCODE_AGENTS_DIR}"/*.md 2>/dev/null | wc -l)
        if [ "$agent_count" -gt 0 ]; then
            log_success "${agent_count} agent(s) installed"
        else
            log_error "No agents found"
            ((errors++))
        fi
    else
        log_error "Agents directory not created"
        ((errors++))
    fi
    
    # Check config
    if [ -f "${OPENCODE_CONFIG_DIR}/opencode.json" ]; then
        log_success "Config installed"
    else
        log_warn "Config not installed (optional)"
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
    echo -e "${BLUE}                    POST-INSTALL INFO                        ${NC}"
    echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
    echo ""
    echo "  Usage:"
    echo ""
    echo "    # Start opencode with master-dev agent:"
    echo -e "    ${GREEN}opencode --agent master-dev${NC}"
    echo ""
    echo "    # Or just start normally (uses master-dev by default):"
    echo -e "    ${GREEN}opencode${NC}"
    echo ""
    echo "    # In opencode, press TAB to switch agents"
    echo ""
    echo "  Locations:"
    echo "    • Config: ~/.config/opencode/"
    echo "    • Agents: ~/.config/opencode/agents/"
    echo "    • AGENTS.md: ~/.config/opencode/AGENTS.md"
    echo ""
    echo "  Update agents:"
    echo "    cd ~/opencode-agents && ./scripts/update.sh"
    echo ""
    echo "  For more info: cat README.md"
    echo ""
    echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
    echo ""
}

# =============================================================================
# Main
# =============================================================================

main() {
    banner
    
    log_info "Starting setup..."
    echo ""
    
    check_requirements
    echo ""
    
    install_agents
    echo ""
    
    install_config
    echo ""
    
    install_agents_md
    echo ""
    
    verify_installation
    show_post_install
}

# Run
main "$@"
