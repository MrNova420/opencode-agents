# opencode-agents

> Quick setup for your personal AI coding assistant with a full dev team.

yo! this project sets up opencode with your custom agents and guidelines so you can have your personal dev team anywhere.

## features

- **9 master developer agents** working as a team
- **orchestrator** manages everything - just talk to one person
- **specialized agents** for every aspect of development
- comprehensive AGENTS.md guidelines
- one-command setup
- cross-platform (linux, macos, windows/wsl)

## the dev team

```
👑 ORCHESTRATOR (Your Main Contact)
    │
    ├── 🏗️ ARCHITECT - System design, architecture
    ├── 🎨 FRONTEND-DEV - UI, React, components
    ├── ⚙️ BACKEND-DEV - APIs, databases, auth
    ├── 🚀 DEVOPS - CI/CD, deployment, Docker
    ├── 🧪 QA-TESTER - Testing, quality, bugs
    ├── 🔬 RESEARCHER - R&D, tech evaluation
    ├── 🔒 SECURITY-DEV - Security, audits
    └── 📝 DOCS-WRITER - Documentation, specs
```

**Every agent is a master developer first** - they can all write any code, build any project. Specialization means extra expertise, not limited scope.

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

### switch between agents

in opencode, press `TAB` to cycle agents, or use `@agentname`:

```
@orchestrator start a new project
@architect design the system
@frontend-dev build the UI
@backend-dev implement the API
```

### using subagents

the orchestrator can spawn subagents for parallel work:

```
@architect design while @researcher evaluates tech stack
```

## project structure

```
opencode-agents/
├── agents/
│   ├── master-dev.md           # original master dev agent
│   └── dev-team/              # full dev team
│       ├── orchestrator.md      # team manager
│       ├── architect.md        # system design
│       ├── frontend-dev.md     # UI specialist
│       ├── backend-dev.md      # backend specialist
│       ├── devops.md          # infrastructure
│       ├── qa-tester.md       # testing
│       ├── researcher.md       # R&D
│       ├── security-dev.md     # security
│       ├── docs-writer.md     # documentation
│       └── README.md          # team docs
├── templates/
│   └── AGENTS.md              # main guidelines
├── config/
│   └── opencode.json          # opencode config
├── scripts/
│   ├── install-opencode.sh    # install opencode
│   ├── update.sh             # update agents
│   └── reset.sh              # reset to defaults
├── setup.sh                   # main setup script
├── quickstart.sh              # one-command installer
└── README.md
```

## customization

### adding custom agents

1. create a new `.md` file in `agents/` or `agents/dev-team/`
2. update `config/opencode.json` to register the agent
3. run `./scripts/update.sh`

## requirements

- opencode installed ([install guide](https://opencode.ai/docs/))
- git (for cloning)
- curl (for one-line install)

## supported platforms

- ✅ linux (ubuntu, debian, fedora, arch, etc.)
- ✅ macos
- ✅ windows (via wsl or git bash)

## agent capabilities

| Agent | What They Do |
|-------|--------------|
| orchestrator | Coordinates team, manages projects, your main contact |
| architect | System design, data models, API contracts |
| frontend-dev | React, UI components, styling, UX |
| backend-dev | APIs, databases, authentication, business logic |
| devops | CI/CD, Docker, Kubernetes, deployment |
| qa-tester | Testing, quality assurance, bug hunting |
| researcher | Tech research, evaluations, proofs of concept |
| security-dev | Security audits, auth, vulnerability testing |
| docs-writer | README, API docs, technical specs |

## contributing

contributions welcome! feel free to submit PRs, report bugs, or suggest new agents.

## license

MIT

---

built with ❤️ for developers who want their AI dev team everywhere
