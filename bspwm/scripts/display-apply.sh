#!/bin/sh
# Apply display layout via autorandr; guarantee a usable primary even if no match.

set -eu
export PYTHONWARNINGS="${PYTHONWARNINGS:-ignore::SyntaxWarning}"

# autorandr
if command -v autorandr >/dev/null 2>&1; then
  autorandr --change --default default >/dev/null 2>&1 || :
fi

# fallback
if ! xrandr --query | grep -q " connected primary"; then
  FIRST="$(xrandr --query | awk '/ connected/{print $1; exit}')"
  [ -n "${FIRST:-}" ] && xrandr --output "$FIRST" --auto --primary
fi

