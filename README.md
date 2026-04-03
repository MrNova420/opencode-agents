# opencode-agents

> Quick setup for your personal AI coding assistant with a full dev team.

yo! this project sets up opencode with your custom agents and guidelines so you can have your personal dev team anywhere.

## features

- **10 universal master developer agents** - can build anything
- **orchestrator** manages everything - just talk to one person
- **specialized agents** for every aspect of development
- comprehensive AGENTS.md guidelines
- one-command setup
- cross-platform (linux, macos, windows/wsl)

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

## quick start

### one-line install

```bash
curl -fsSL https://raw.githubusercontent.com/MrNova420/opencode-agents/main/quickstart.sh | bash
```

### manual install

```bash
git clone https://github.com/MrNova420/opencode-agents.git
cd opencode-agents
chmod +x setup.sh
./setup.sh
```

## usage

### start with the orchestrator (your main contact)

```bash
opencode --agent orchestrator
```

just tell the orchestrator what you want to build, and they'll coordinate the whole team.

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
│   ├── install-opencode.sh
│   ├── update.sh
│   └── reset.sh
├── setup.sh
├── quickstart.sh
└── README.md
```

## requirements

- opencode installed ([install guide](https://opencode.ai/docs/))
- git (for cloning)
- curl (for one-line install)

## supported platforms

- ✅ linux (ubuntu, debian, fedora, arch, etc.)
- ✅ macos
- ✅ windows (via wsl or git bash)

## license

MIT

---

built with ❤️ for developers who want their ai dev team everywhere
