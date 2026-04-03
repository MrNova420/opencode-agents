# opencode-agents

> Quick setup for your personal AI coding assistant with a full dev team.

yo! this project sets up opencode with your custom agents and guidelines so you can have your personal dev team anywhere.

## features

- **10 universal master developer agents** - can build anything
- **Orchestrator** manages everything - just talk to one person
- **Specialized agents** for every aspect of development
- Comprehensive AGENTS.md guidelines
- **One-command setup** - installs OpenCode CLI if needed!
- Cross-platform (linux, macos, windows/wsl)
- Version control tracking with rollback capability

## the dev team

```
👑 ORCHESTRATOR (Your Main Contact)
    │
    ├── 🏗️ ARCHITECT - System design, data models
    ├── 🎨 FRONTEND-DEV - React, UI, components
    ├── ⚙️ BACKEND-DEV - APIs, databases, auth
    ├── 🚀 DEVOPS - CI/CD, deployment, Docker
    ├── 🧪 QA-TESTER - Testing, quality, bugs
    ├── 🔬 RESEARCHER - R&D, tech evaluation
    ├── 🔒 SECURITY-DEV - Security, audits
    └── 📝 DOCS-WRITER - Documentation, specs
```

**Every agent is a UNIVERSAL MASTER DEVELOPER first.**

They can all work with ANY technology, ANY project type, ANY industry.

## quick start (one-line install)

```bash
curl -fsSL https://raw.githubusercontent.com/MrNova420/opencode-agents/main/quickstart.sh | bash
```

This will:
1. Install OpenCode CLI if not present
2. Clone the repo (or update if exists)
3. Install all agents
4. Configure everything

## manual install

```bash
# Clone the repo
git clone https://github.com/MrNova420/opencode-agents.git
cd opencode-agents

# Run setup (installs opencode if needed)
chmod +x setup.sh
./setup.sh
```

## usage

### start with the orchestrator (your main contact)

```bash
opencode --agent orchestrator
```

Just tell the orchestrator what you want to build, and they'll coordinate the whole team.

### available agents (press TAB to switch)

| Agent | Mode | Invoke |
|-------|------|--------|
| **orchestrator** | Primary | default |
| **master-dev** | Primary | TAB |
| **architect** | All | TAB or @architect |
| **frontend-dev** | All | TAB or @frontend-dev |
| **backend-dev** | All | TAB or @backend-dev |
| **devops** | All | TAB or @devops |
| **qa-tester** | All | TAB or @qa-tester |
| **researcher** | All | TAB or @researcher |
| **security-dev** | All | TAB or @security-dev |
| **docs-writer** | All | TAB or @docs-writer |

### using agents directly

```
@orchestrator start a new project
@architect design the system
@frontend-dev build the UI
@backend-dev implement the API
@devops set up deployment
@qa-tester write comprehensive tests
@researcher find the best framework
@security-dev audit the code
@docs-writer write the documentation
```

## universal capabilities

every agent can work with:

**ANY TECHNOLOGY:**
- web: React, Vue, Svelte, Angular, Next.js, Nuxt
- mobile: React Native, Flutter, Swift, Kotlin
- backend: Node.js, Python, Go, Rust, Java, C#
- databases: PostgreSQL, MongoDB, Redis, MySQL
- cloud: AWS, GCP, Azure, DigitalOcean, Vercel
- devops: Docker, Kubernetes, CI/CD, Terraform
- ai/ml: OpenAI, LangChain, TensorFlow, PyTorch
- blockchain: Solidity, Rust, web3.js
- desktop: Electron, Tauri, Qt
- games: Unity, Unreal, Godot, Phaser

**ANY PROJECT TYPE:**
- web apps, mobile apps, apis, cli tools, libraries, games, bots, dashboards, cms, ecommerce, social platforms, saas products

**ANY INDUSTRY:**
- fintech, healthtech, edtech, ecommerce, saas, gaming, social, iot, automation

## project structure

```
opencode-agents/
├── agents/
│   ├── master-dev.md              # universal master dev
│   └── dev-team/                 # full dev team
│       ├── orchestrator.md        # team manager
│       ├── architect.md          # system design
│       ├── frontend-dev.md       # UI specialist
│       ├── backend-dev.md        # backend specialist
│       ├── devops.md             # infrastructure
│       ├── qa-tester.md         # testing
│       ├── researcher.md         # R&D
│       ├── security-dev.md       # security
│       └── docs-writer.md        # documentation
├── templates/
│   └── AGENTS.md                 # main guidelines
├── config/
│   └── opencode.json             # opencode config
├── scripts/
│   ├── install-opencode.sh       # standalone opencode installer
│   ├── update.sh                # update agents from repo
│   └── reset.sh                 # reset to defaults
├── setup.sh                     # main setup (auto-installs opencode)
├── quickstart.sh                # one-line installer
└── README.md
```

## requirements

- **git** (for cloning)
- **curl** (for one-line install)
- OpenCode is installed automatically if not present

## supported platforms

- ✅ Linux (Ubuntu, Debian, Fedora, Arch, etc.)
- ✅ macOS
- ✅ Windows (via WSL or Git Bash)

## troubleshooting

### OpenCode not found after install

If the install script completes but `opencode` isn't found, try:

```bash
# Source your shell config
source ~/.bashrc

# Or restart your terminal
exec bash

# Verify installation
opencode --version
```

### Manual OpenCode install

If you need to install OpenCode manually:

```bash
# Official installer
curl -fsSL https://opencode.ai/install | sh

# Or via npm
npm install -g opencode-ai

# Or on macOS with Homebrew
brew install anomalyco/tap/opencode
```

### Update agents

```bash
cd ~/opencode-agents
./scripts/update.sh
```

## license

MIT

---

Built with ❤️ for developers who want their AI dev team everywhere
