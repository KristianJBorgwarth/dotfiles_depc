# 🖥️ Local Display & Workspace Profiles

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
