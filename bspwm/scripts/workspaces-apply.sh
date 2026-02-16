#!/bin/sh
set -eu

DOTFILES="${DOTFILES:-$HOME/private_projects/dotfiles_depc}"
PROFILES_DIR="$DOTFILES/bspwm/profiles"

wipe_desktops() {
  # Move everything to the first monitor, then remove.
  # This avoids "can't remove last desktop" / weird distribution issues.
  PRIMARY="$(bspc query -M | head -n1 || true)"
  [ -n "${PRIMARY:-}" ] || return 0

  for d in $(bspc query -D 2>/dev/null); do
    bspc desktop "$d" -m "$PRIMARY" 2>/dev/null || true
  done

  for d in $(bspc query -D 2>/dev/null); do
    bspc desktop "$d" -r 2>/dev/null || true
  done
}

CUR_PROFILE=""
if command -v autorandr >/dev/null 2>&1; then
  CUR_PROFILE="$(autorandr --current 2>/dev/null || true)"
fi

if [ -n "$CUR_PROFILE" ] && [ -r "$PROFILES_DIR/$CUR_PROFILE.sh" ]; then
  wipe_desktops
  # shellcheck disable=SC1090
  . "$PROFILES_DIR/$CUR_PROFILE.sh"
  exit 0
fi

# Generic fallback mapping based on number of monitors.
MONS="$(bspc query -M --names)"
NMONS="$(printf '%s\n' "$MONS" | wc -l | awk '{print $1}')"

if [ "$NMONS" -ge 3 ]; then
  M1="$(printf '%s\n' "$MONS" | sed -n '1p')"
  M2="$(printf '%s\n' "$MONS" | sed -n '2p')"
  M3="$(printf '%s\n' "$MONS" | sed -n '3p')"
  [ -n "$M1" ] && bspc monitor "$M1" -d 1 2 3
  [ -n "$M2" ] && bspc monitor "$M2" -d 4 5 6
  [ -n "$M3" ] && bspc monitor "$M3" -d 7 8 9
elif [ "$NMONS" -eq 2 ]; then
  M1="$(printf '%s\n' "$MONS" | sed -n '1p')"
  M2="$(printf '%s\n' "$MONS" | sed -n '2p')"
  [ -n "$M1" ] && bspc monitor "$M1" -d 1 2 3 4 5
  [ -n "$M2" ] && bspc monitor "$M2" -d 6 7 8 9
else
  M="$(printf '%s\n' "$MONS" | head -n1)"
  [ -n "$M" ] && bspc monitor "$M" -d 1 2 3 4 5 6 7 8 9
fi

