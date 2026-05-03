#!/usr/bin/env bash
# Auto-commit and push Claude Code session records to GitHub.
# Fires from Stop hook. Silent if nothing changed, never blocks the agent.

set -u

REPO_DIR="/Users/a0000/.claude/projects/-Users-a0000"
GH_BIN="/Users/a0000/.local/bin/gh"
LOG="$REPO_DIR/.scripts/auto_push.log"

cd "$REPO_DIR" 2>/dev/null || exit 0

# Ensure gh is on PATH for git's credential helper
export PATH="/Users/a0000/.local/bin:$PATH"

{
  echo "=== $(date -u +%Y-%m-%dT%H:%M:%SZ) ==="
  if git diff --quiet && git diff --cached --quiet && [ -z "$(git ls-files --others --exclude-standard)" ]; then
    echo "no changes"
    exit 0
  fi

  git add -A
  git commit -m "auto: session snapshot $(date -u +%Y-%m-%dT%H:%M:%SZ)" >/dev/null 2>&1 || {
    echo "commit failed (probably nothing staged)"
    exit 0
  }
  git push origin main 2>&1 || echo "push failed (offline?)"
} >> "$LOG" 2>&1 &

exit 0
