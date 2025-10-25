#!/bin/sh

set -eu
DOTFILES="${DOTFILES:-$HOME/dotfiles}"

if command -v picom >/dev/null 2>&1; then
  pgrep -x picom >/dev/null || picom &
fi
sleep 0.15

if command -v feh >/dev/null 2>&1; then
  feh --no-fehbg --bg-fill "$DOTFILES/cosmetics/wallpapers/foggy-woods.jpg"
fi

if [ -x "$HOME/.config/polybar/launch.sh" ]; then
  "$HOME/.config/polybar/launch.sh" &
fi

if command -v dunst >/dev/null 2>&1; then
  pgrep -x dunst >/dev/null || dunst &
fi

