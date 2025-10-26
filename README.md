# Incorrect and unfinished README instructions. will update
---
# Dotfiles

These are my personal configuration files for a minimal Linux desktop setup. They include settings for window management, terminal, status bar, compositor, and more.

## Included Configurations

- **bspwm/**: Window manager configuration (`bspwmrc`)
- **sxhkd/**: Hotkey daemon configuration (`sxhkdrc`)
- **polybar/**: Status bar configuration (`config.ini`, `launch.sh`)
- **ghostty/**: Terminal emulator configuration (`config`, `themes/`)
- **dunst/**: Notification daemon configuration (`dunstrc`)
- **alacritty/**: Alacritty terminal configuration (`alacritty.toml`)
- **zsh/**: Zsh shell configuration (`zshrc`)
- **omp/**: Oh My Posh prompt themes - consider using 'oh-my-zsh' cause oh-my-posh is kinda slow to load
- **mods/**: Miscellaneous scripts or modules
- **picom/**: Compositor configuration (`picom.conf`)
- **rofi/**: Application launcher configuration (`config.rasi`)
- **cosmetics/**: Fonts and wallpapers

## Usage

1. Clone this repository:

   ```sh
   git clone https://github.com/KristianJBorgwarth/dotfiles.git
   ```

2. Copy or symlink the configs to your home directory as needed.
3. Install the required software:
   - bspwm
   - sxhkd
   - polybar
   - ghostty
   - zsh
   - dunst for notifications
   - oh-my-posh (for prompt themes)
   - picom (for compositor effects)
   - rofi (for application launcher)
   - nvim (optional, but some shortcuts open files and directories with nvim; you can change those to use nano, micro or code, if you want)
4. Restart your session or reload the configs.

## Customization

Feel free to edit any config file to match your preferences.
---

> Maintained by KristianJBorgwarth
