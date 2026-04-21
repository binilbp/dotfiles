
# dotfiles
### Pop!_OS 

***

## Table of Contents

1. [Core Components](#1-core-components)
2. [Repository Structure](#2-repository-structure)
3. [Prerequisites](#3-prerequisites)
4. [Installation & Deployment](#4-installation--deployment)
5. [Management with GNU Stow](#5-management-with-gnu-stow)

***

## 1. Core Components

This setup replaces default system tools with modern, high-performance alternatives:

* **Terminal Emulator:** Kitty
* **Shell:** Zsh (managed via Zinit)
* **Shell Prompt:** Oh My Posh
* **Terminal Multiplexer:** Zellij
* **Text Editor (CLI):** Neovim (configured with Lazy.nvim)
* **Text Editor (GUI):** Zed
* **File Manager:** Yazi
* **System Fetch:** Fastfetch

***

## 2. Repository Structure

The directory is organized to mirror your home directory (`~/`). When GNU Stow is executed, it safely symlinks the contents of this folder 
directly into your home folder.

### Configuration Breakdown (`.config/`)

* **`fastfetch/`**: Contains `config.jsonc`, customized to display specific system information modules.
* **`kitty/`**: Contains the core `kitty.conf` (font sizing, cursor trails, audio bell settings) and the "Night Owl" color theme.
* **`nvim/`**: A fully customized Neovim setup.
    * `init.lua`: Core Neovim options (relative line numbers, clipboard support, tab widths).
    * `lua/config/lazy.lua`: Bootstraps the Lazy plugin manager.
    * `lua/plugins/`: Modular plugin configurations including Catppuccin (theme), Telescope (fuzzy finder), Neo-tree (file explorer), 
Lualine (status line), and Treesitter (syntax highlighting).
* **`ohmyposh/`**: Contains `config.json`, which dictates the prompt's layout, Git status formatting, and execution time tracking.
* **`xfce4/`**: Sets Kitty as the default terminal emulator at the system level (`helpers.rc`).
* **`yazi/`**: Contains `yazi.toml`, mapping file types to default applications (e.g., PDFs to Evince, text to Neovim).
* **`zed/`**: Contains `settings.json`, enforcing Vim mode, Nightfox themes, and relative line numbers.
* **`zellij/`**: Contains `config.kdl`, configuring custom keybindings, default layouts, and defining "locked" as the default mode.

### Root Level Files

* **`.zshrc`**: The main shell configuration file. It initializes Oh My Posh, configures the Zinit plugin manager, loads syntax 
highlighting/fzf-completions, sets up shell aliases (`ll`, `dots`), and lazy-loads NVM.
* **`.stow-local-ignore`**: A crucial file that tells GNU Stow which files/folders *not* to symlink (e.g., `.git`, `README.md`, `images/`).
* **`scripts/`**: A directory for local automation scripts, such as `convert.sh` (a batch FFmpeg script to convert `.mp4` files to `.mp3`).

***

## 3. Prerequisites

Before deploying these dotfiles, ensure the required software is installed. For Debian/Pop!\_OS/Ubuntu systems:

### Install GNU Stow (Required for deployment):

```bash
sudo apt update
sudo apt install stow
```

### Install Core Utilities (Highly Recommended):

```bash
sudo apt install zsh kitty neovim ffmpeg tree-sitter-cli
```

*(Note: Tools like Zellij, Yazi, Oh My Posh, and Fastfetch may need to be installed via their respective binary releases or Cargo/Homebrew, 
as they are not always up-to-date in default APT repositories.)*

***

## 4. Installation & Deployment

### Step 1: Clone the Repository

Clone the dotfiles into your home directory.

```bash
git clone https://github.com/binilbp/dotfiles.git ~/dotfiles
cd ~/dotfiles/dotfiles-pop-os
```

### Step 2: Backup Existing Configurations

Deployment will overwrite files with the same name. Back up your existing setup first:

```bash
mv ~/.zshrc ~/.zshrc.backup
mv ~/.config/kitty ~/.config/kitty.backup
mv ~/.config/nvim ~/.config/nvim.backup
```

### Step 3: Deploy with Stow

From inside the `dotfiles-pop-os` directory, run the `stow` command pointing to the current directory (`.`):

```bash
stow .
```

This creates symlinks in your home directory pointing to the files in this repository.

### Step 4: Change Default Shell

To make Zsh your default shell, run:

```bash
chsh -s $(which zsh)
```

Log out and log back in for this change to take effect.

***

## 5. Management with GNU Stow

GNU Stow makes dotfile management painless. Because the files in your `~/.config` and `~/` directories are now just shortcuts (symlinks) to 
this repository, any changes you make to your configs are automatically reflected in the `~/dotfiles` folder.

* **To save changes:** Simply `cd ~/dotfiles`, `git add .`, `git commit`, and `git push`.
* **To remove the symlinks:** If you want to uninstall these configurations, run `stow -D .` from inside the cloned repository.
