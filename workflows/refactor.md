---
description: "Removes dead code and simplifies logic while preserving functionality"
---
# Refactor Workflow

1. **Identify large files (complexity smell)**
// turbo
```bash
find src/ \( -name '*.ts' -o -name '*.tsx' \) -exec wc -l {} + | awk '$1 > 200' | sort -rn
```

2. **Find repeated Supabase call patterns**
// turbo
```bash
grep -rn 'supabase\.from(' src/hooks/ | awk -F: '{print $1}' | sort | uniq -c | sort -rn | head -20
```

3. **Generate Implementation Plan**
Create implementation_plan.md with proposed abstractions. **Wait for user approval.**

4. **Apply refactors and verify**
// turbo
```bash
npm run lint && npm run test && npm run build
```
