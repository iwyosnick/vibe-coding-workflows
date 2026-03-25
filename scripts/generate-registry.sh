#!/bin/bash
# Generates .agent/registry.generated — a complete, accurate file inventory.
# Run via /test-core or manually. Agents should read this file for navigation.
echo "# Auto-generated registry — $(date -u +%Y-%m-%dT%H:%M:%SZ)" > .agent/registry.generated
echo "# Do not edit manually. Regenerate with: .agent/scripts/generate-registry.sh" >> .agent/registry.generated
echo "" >> .agent/registry.generated
echo "## Hooks" >> .agent/registry.generated
find src/hooks -name '*.ts' 2>/dev/null | sort >> .agent/registry.generated
echo "" >> .agent/registry.generated
echo "## Services" >> .agent/registry.generated
find src/services -name '*.ts' 2>/dev/null | sort >> .agent/registry.generated
echo "" >> .agent/registry.generated
echo "## Components" >> .agent/registry.generated
find src/components -name '*.tsx' 2>/dev/null | sort >> .agent/registry.generated
echo "" >> .agent/registry.generated
echo "## Pages" >> .agent/registry.generated
find src/pages -name '*.tsx' 2>/dev/null | sort >> .agent/registry.generated
echo "" >> .agent/registry.generated
echo "## Utils" >> .agent/registry.generated
find src/utils -name '*.ts' 2>/dev/null | sort >> .agent/registry.generated
echo "" >> .agent/registry.generated
echo "## Types" >> .agent/registry.generated
find src/types -name '*.ts' 2>/dev/null | sort >> .agent/registry.generated
echo "" >> .agent/registry.generated
echo "## Contexts" >> .agent/registry.generated
find src/contexts -name '*.tsx' 2>/dev/null | sort >> .agent/registry.generated
