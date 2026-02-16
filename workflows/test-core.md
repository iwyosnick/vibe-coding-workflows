# Core Health Check Workflow

A comprehensive, automated test suite that answers one question: **Is my app healthy?**

## What It Does

Runs 8 checks in sequence. If any check fails, the workflow stops immediately and tells you exactly what's wrong.

## The Checks

### 1. Secrets Safety
Verifies that sensitive files (like `.env`) are not tracked by version control and won't be accidentally exposed.

**Why it's first:** This is the fastest check (~instant) and the most catastrophic failure mode. No point checking code quality if your API keys are public.

### 2. Code Quality (Lint)
Scans for style violations, unused variables, and common mistakes.

**Think of it as:** Spell-check for your code.

### 3. Type Safety
Verifies that data types are used correctly throughout the app (e.g., numbers aren't being passed where text is expected).

**Think of it as:** Making sure every puzzle piece goes in the right slot.

### 4. Security Audit
Scans all dependencies for known security vulnerabilities.

**Why it matters:** Your app uses dozens of packages built by other developers. This checks if any have known security problems.

### 5. Unit Tests
Fast, focused spot-checks on individual pieces of logic.

**Example:** "If I create something with the same name as something that already exists, does it add '(1)' to the end?"

### 6. Build Verification
Compiles the entire app into a production-ready bundle.

**Think of it as:** The dress rehearsal before showtime. Individual pieces might work, but this forces everything to come together.

### 7. End-to-End UX Tests
Opens a real browser and simulates user interactions (clicking buttons, filling forms, navigating pages).

**Why it's last:** This is the most expensive check, but also the most comprehensive. It catches UI bugs that all other checks miss.

### 8. Pre-Deploy Reminder
Surfaces a manual checklist for things that require human judgment before pushing to production.

---

## Implementation (npm/JavaScript/TypeScript)

```bash
# 1. Secrets Safety
grep -q "^\.env" .gitignore || (echo "ERROR: .env not in .gitignore!" && exit 1)
git ls-files --error-unmatch .env 2>/dev/null && (echo "ERROR: .env is tracked!" && exit 1) || true

# 2. Code Quality
npm run lint

# 3. Type Safety
npm run typecheck

# 4. Security Audit
npm audit --audit-level=high

# 5. Unit Tests
npm run test

# 6. Build
npm run build

# 7. E2E Tests
npx playwright test
```

---

## Adapting to Other Stacks

| Step | Python | Rust | Go |
|---|---|---|---|
| **Lint** | `pylint src/` | `cargo clippy` | `golangci-lint run` |
| **Type Check** | `mypy src/` | Built into `cargo check` | Built into `go build` |
| **Security** | `pip-audit` | `cargo audit` | `go list -json -m all \| nancy sleuth` |
| **Unit Tests** | `pytest` | `cargo test` | `go test ./...` |
| **Build** | `python -m build` | `cargo build --release` | `go build` |
| **E2E Tests** | `pytest tests/e2e/` | Custom (Selenium, etc.) | Custom (Selenium, etc.) |

---

## Why the Order Matters

The checks are sequenced to **fail fast** — catch problems at the cheapest possible moment:

1. **Secrets** → Instant, catastrophic if it fails
2. **Lint/Types** → Fast (~seconds), catches surface issues
3. **Security** → Moderate (~10s), checks dependencies
4. **Unit Tests** → Fast (~1s), verifies logic
5. **Build** → Moderate (~3s), integration check
6. **E2E** → Expensive (~10s), comprehensive UX check

If a type error exists, you don't want to waste 10 seconds running browser tests. You want to know in 2 seconds.

---

## For AI Coding Tools

Save this as a workflow file in your tool's workflow directory:

- **Google Antigravity**: `.agent/workflows/test-core.md`
- **Cursor**: `.cursor/workflows/test-core.md`
- **Claude Code**: `.claude/workflows/test-core.md`
- **Windsurf**: `.windsurf/workflows/test-core.md`

Trigger it with `/test-core` after any significant coding session.

---

## Expected Results

When everything passes, you'll see something like:

```
✓ Secrets check passed
✓ Lint: 0 errors, 16 warnings
✓ Type check: clean
✓ Security: no high-severity issues
✓ Unit tests: 13/13 passed (1.0s)
✓ Build: success (3.4s)
✓ E2E tests: 10/10 passed (9.8s)
```

When something fails, the workflow stops and shows you exactly what's wrong.

---

## Learn More

Read the full blog post: **[I Built a One-Command Health Check for My AI-Built App](https://www.tayle.co/blog/test-core-workflow)**

Part of the [Vibe Coding series](https://www.tayle.co/blog).
