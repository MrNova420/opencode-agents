# opencode-agents

> Quick setup for your personal AI coding assistant with custom agents and guidelines.

yo! this project sets up your opencode with custom agents and guidelines so you can have your personal dev assistant anywhere.

## features

- custom agent profiles (master-dev and more)
- comprehensive AGENTS.md guidelines
- one-command setup
- cross-platform (linux, macos, windows/wsl)

## quick start

### one-line install

```bash
curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/opencode-agents/main/setup.sh | bash
```

### manual install

```bash
git clone https://github.com/YOUR_USERNAME/opencode-agents.git
cd opencode-agents
chmod +x setup.sh
./setup.sh
```

## what's included

### agents

- **master-dev**: your main development partner with full planning, design, research, and coding capabilities

### guidelines

- **AGENTS.md**: comprehensive coding guidelines including:
  - code style & conventions
  - typescript patterns
  - react patterns
  - testing standards
  - git workflow
  - security best practices
  - performance optimization
  - and much more

## project structure

```
opencode-agents/
├── agents/              # custom agent definitions
│   └── master-dev.md   # master developer agent
├── templates/           # template files
│   └── AGENTS.md      # main guidelines template
├── setup.sh            # main setup script
├── config/             # config files
│   └── opencode.json   # opencode config
├── scripts/            # utility scripts
│   ├── install.sh      # opencode installation
│   ├── update.sh      # update agents
│   └── reset.sh       # reset to defaults
├── LICENSE
└── README.md
```

## usage

### after setup

```bash
# start opencode with your custom agent
opencode --agent master-dev

# or just start opencode normally (uses master-dev by default)
opencode
```

### switch agents

in opencode, press `TAB` to cycle between agents, or:

```bash
opencode --agent master-dev
```

### update agents

```bash
cd opencode-agents
./scripts/update.sh
```

## customization

### adding custom agents

1. create a new `.md` file in `agents/`:

```markdown
---
description: Description of what this agent does
mode: primary
temperature: 0.3
---

# your agent prompt here
```

2. update `config/opencode.json` to register the agent

3. run `./scripts/update.sh`

### modifying guidelines

edit `templates/AGENTS.md` and run:

```bash
./scripts/update.sh
```

## requirements

- opencode installed ([install guide](https://opencode.ai/docs/))
- git (for cloning)
- curl (for one-line install)

## supported platforms

- ✅ linux (ubuntu, debian, fedora, arch, etc.)
- ✅ macos
- ✅ windows (via wsl or git bash)

## contributing

contributions welcome! feel free to submit prs, report bugs, or suggest features.

## license

mit

---

built with ❤️ for developers who want their ai assistant everywhere
