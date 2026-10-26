#!/bin/bash
# One turn of a comparison run: run.sh <1|2> "<prompt>" [session-id-to-resume]
# Both runs use this script unchanged: same model, permissions, allowed and blocked commands.
# The transcript is appended to logs/run<N>.jsonl; each turn's seconds go to logs/run<N>.times.
set -u
X=/Users/Shared/compare-cc
n=$1; prompt=$2; resume=${3:-}
export CLAUDE_CONFIG_DIR="$X/cfg$n"
export GIT_SSH_COMMAND="ssh -o Hostname=ssh.github.com -o Port=443 -o ServerAliveInterval=15"
cd "$X/run$n" || exit 2
ALLOW=(Read Write Edit MultiEdit Glob Grep TodoWrite WebFetch WebSearch Skill Task
  "Bash(npm:*)" "Bash(npx:*)" "Bash(node:*)" "Bash(git:*)" "Bash(mkdir:*)" "Bash(ls:*)" "Bash(cat:*)"
  "Bash(cp:*)" "Bash(mv:*)" "Bash(rm:*)" "Bash(python3:*)" "Bash(pip3:*)" "Bash(cd:*)" "Bash(pwd)"
  "Bash(echo:*)" "Bash(test:*)" "Bash(find:*)" "Bash(grep:*)" "Bash(sed:*)" "Bash(head:*)"
  "Bash(tail:*)" "Bash(wc:*)" "Bash(touch:*)" "Bash(chmod:*)" "Bash(bash:*)" "Bash(sh:*)"
  "Bash(sort:*)" "Bash(diff:*)" "Bash(curl:*)")
# Nothing may publish: the experimenter deploys both runs the same way afterwards.
DENY=("Bash(gh:*)" "Bash(wrangler:*)" "Bash(npx wrangler:*)" "Bash(git push:*)" "Bash(git remote add:*)")
args=(-p "$prompt" --model claude-opus-5-5 --permission-mode acceptEdits --output-format stream-json --verbose
  --allowedTools "${ALLOW[@]}" --disallowedTools "${DENY[@]}")
[ -n "$resume" ] && args+=(--resume "$resume")
start=$(date +%s)
timeout 14400 claude "${args[@]}" >> "$X/logs/run$n.jsonl" 2>> "$X/logs/run$n.err"
code=$?
echo "turn ended $(date -u +%FT%TZ) exit $code seconds $(( $(date +%s) - start ))" >> "$X/logs/run$n.times"
exit $code
