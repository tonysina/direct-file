#!/bin/bash
# Runs formatting and static analysis checks for all Java modules
set -euo pipefail
modules=(backend submit status state-api email-service)
for module in "${modules[@]}"; do
  if [ -d "direct-file/${module}" ]; then
    echo "[pre-commit] Running checks for ${module}"
    (cd "direct-file/${module}" && ./mvnw spotless:check compile spotbugs:check pmd:check)
  fi
done
