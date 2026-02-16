# Vibe Coding Workflows

A collection of workflows and rules for building production-quality apps with AI coding assistants.

## About

These workflows are designed for **vibe coders** — people building real applications with AI assistance who want to maintain quality, security, and confidence without needing a traditional software engineering background.

Each workflow is a single command that runs a comprehensive set of checks. If anything fails, you know exactly what's wrong. If everything passes, you know your app is healthy.

## Blog Series

This repository accompanies a blog series on vibe coding:

1. **[An Agent Rules File That Will Change How You Vibe Code](https://www.tayle.co/blog/agent-rules-file)** — The global rules file that brings structure to AI-assisted development
2. **[I Built a One-Command Health Check for My AI-Built App](https://www.tayle.co/blog/test-core-workflow)** — The `/test-core` workflow (this repo)
3. *More coming soon...*

## Contents

### Rules

- **[agent-rules.md](rules/agent-rules.md)** — Global rules for your AI coding assistant. Establishes a three-phase workflow (Planning → Execution → Review) and sets quality standards.

### Workflows

- **[test-core.md](workflows/test-core.md)** — Comprehensive health check workflow. Runs linting, type checking, security audits, unit tests, build verification, and end-to-end UX tests in sequence.

## How to Use

### For AI Coding Tools

Most modern AI coding tools support persistent rules and workflows:

| Tool | Global Rules | Per-Project Workflows |
|---|---|---|
| **Google Antigravity** | `~/.gemini/GEMINI.md` | `.agent/workflows/` in project root |
| **Cursor** | Cursor Settings → Rules | `.cursor/workflows/` in project root |
| **Claude Code** | `~/.claude/CLAUDE.md` | `.claude/workflows/` in project root |
| **Windsurf** | Windsurf Settings → Rules | `.windsurf/workflows/` in project root |

1. Copy the files from this repo to the appropriate location for your tool
2. Restart your AI coding session
3. Trigger workflows with commands like `/test-core`

### Adapting to Your Stack

The workflows use npm/JavaScript examples, but the structure applies to any language:

- **Linting** → `npm run lint` / `pylint` / `cargo clippy`
- **Type checking** → `tsc --noEmit` / `mypy` / built into compiled languages
- **Security audit** → `npm audit` / `pip-audit` / `cargo audit`
- **Unit tests** → `vitest` / `pytest` / `cargo test`
- **Build** → `vite build` / `python -m build` / `cargo build`
- **E2E tests** → `playwright` / `selenium` / `cypress`

## Contributing

Found a bug? Have a suggestion? Open an issue or PR.

## License

MIT — use these however you want.

## Author

Built by [Ian Wyosnick](https://www.tayle.co) while building [Tayle](https://www.tayle.co), a platform for preserving life stories.
