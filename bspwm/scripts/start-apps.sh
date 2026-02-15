#!/bin/sh

set -eu
DOTFILES="${DOTFILES:-$HOME/private_projects/dotfiles_depc}"

if command -v picom >/dev/null 2>&1; then
  pgrep -x picom >/dev/null || picom &
fi

sleep 0.15

WALL="$DOTFILES/cosmetics/wallpapers/cm-purple.jpg"
if command -v feh >/dev/null 2>&1; then
  if [ -f "$WALL" ]; then
    feh --no-fehbg --bg-fill "$WALL" || :
  else
    printf 'WARN: wallpaper not found: %s\n' "$WALL"
  fi
fi

if [ -x "$HOME/.config/polybar/launch.sh" ]; then
  "$HOME/.config/polybar/launch.sh" &
fi

if command -v dunst >/dev/null 2>&1; then
  pgrep -x dunst >/dev/null || dunst &
fi

