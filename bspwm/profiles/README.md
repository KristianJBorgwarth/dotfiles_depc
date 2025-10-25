# Local Display & Workspace Profiles

This folder contains **machine-specific and layout-specific configuration scripts**  
used by `bspwm` to assign desktops to monitors after `autorandr` applies a display setup.

These files are **not tracked by Git** (see `.gitignore`) so each machine can maintain its
own layouts without polluting the shared dotfiles repository.

---

## How It Works

1. [`autorandr`](https://github.com/phillipberndt/autorandr) manages your monitor arrangements  
   (resolution, rotation, position, and which outputs are active).

2. When `bspwm` starts, it calls:

   ```bash
   ~/dotfiles/bspwm/workspaces-apply.sh
   ```

3. This script uses `autorandr --current` to get the name of the active display profile.
   ```autodnr --current

   ```
4. If a matching file exists in this folder (for example desktop.sh for the profile desktop), it will be sourced and executed.

5. If no matching profile script is found, the setup falls back to a generic layout based on the number of connected monitors.

## Examples

> File names must **match** your autorandr profiles (`autorandr --list` / `autorandr --current`).  
> Each script is **sourced** by `workspaces-apply.sh` and should be POSIX `/bin/sh`.

### `desktop.sh` — strict, fixed home setup
Applies **only** if bspwm sees the exact outputs. Returns non-zero otherwise so the caller can fall back.

```sh
#!/bin/sh
# autorandr --current == desktop (fixed PC)
set -eu

have() { bspc query -M --names | grep -Fx "$1" >/dev/null 2>&1; }

if have "DP-2" && have "HDMI-1"; then
  # DP-2 is main (2–9), vertical HDMI-1 gets 1
  bspc monitor DP-2   -d 2 3 4 5 6 7 8 9
  bspc monitor HDMI-1 -d 1
  exit 0
fi

# Names didn’t match → let workspaces-apply.sh do generic fallback
exit 1

