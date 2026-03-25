---
description: Scan and fix "Vibe Smells" in the codebase
---
# Vibe Smells Workflow

1. **Scan for `any` types**
// turbo
```bash
npx eslint --rule '{"@typescript-eslint/no-explicit-any": "error"}' src/ 2>&1 | head -50 || true
```

2. **Scan for empty catch blocks**
// turbo
```bash
grep -rn 'catch.*{[[:space:]]*}' src/ || echo "No empty catch blocks found."
```

3. **Scan for oversized files (>300 lines)**
// turbo
```bash
find src/ \( -name '*.ts' -o -name '*.tsx' \) -exec wc -l {} + | awk '$1 > 300' | sort -rn
```

4. **Refresh auto-generated registry**
// turbo
```bash
.agent/scripts/generate-registry.sh
```

5. **Generate Implementation Plan**
Create implementation_plan.md with detected issues. **Wait for user approval.**

6. **Apply Patches**
Fix issues file-by-file. Run `npm run lint` after each patch.

7. **Final Verification**
// turbo
```bash
npm run lint && npm run test && npm run build
```
