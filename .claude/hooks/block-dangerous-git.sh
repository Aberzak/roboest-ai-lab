#!/usr/bin/env bash
# PreToolUse hook (matcher: Bash). Blocks destructive git commands issued by the agent.
# Exit 2 = block; the message on stderr goes back to Claude. Exit 0 = allow.
# No jq needed: works in Git Bash on Windows.

# Match against the whole JSON payload: parsing "command" without jq breaks on escaped quotes,
# and a false block is cheaper than a missed push.
cmd="$(cat)"

g='git([[:space:]]+-C[[:space:]]+[^[:space:]]+)?[[:space:]]+'
dot='\.([[:space:]]|$|["\\;&|])'   # a bare '.' pathspec, followed by a space, end, quote, backslash or a shell separator
patterns=(
  "${g}push"
  "${g}reset[[:space:]]+--hard"
  "${g}clean[[:space:]]+-[a-zA-Z]*f"
  "${g}branch[[:space:]]+-D"
  "${g}checkout[[:space:]]+${dot}"
  "${g}restore[[:space:]]+${dot}"
)

for p in "${patterns[@]}"; do
  if printf '%s' "$cmd" | grep -Eq "$p"; then
    echo "BLOCKED by .claude/hooks/block-dangerous-git.sh: this git command is not allowed for the agent in this repo. Propose it to the human; a human runs it." >&2
    exit 2
  fi
done
exit 0
