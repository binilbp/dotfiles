# OhMyPosh
export PATH="$PATH:$HOME/.local/bin"
eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/config.json)"

# Zinit Location Variable Setting
ZINIT_HOME="${HOME}/.local/share/zinit/zinit.git"

# Zinit Download and Dir Setup
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Zinit Source
source "${ZINIT_HOME}/zinit.zsh"

# 1. LOAD COMPLETIONS FIRST (Fixes the Tab issue)
zinit light zsh-users/zsh-completions
autoload -U compinit && compinit -C

# 2. LOAD FZF-TAB SECOND
zinit light Aloxaf/fzf-tab

# 3. GET OFFICIAL FZF KEYBINDINGS (Enables Ctrl+R)
zinit snippet https://raw.githubusercontent.com/junegunn/fzf/master/shell/key-bindings.zsh

# Load autosuggestions and syntax highlighting asynchronously
zinit wait"0" lucid for \
    zsh-users/zsh-autosuggestions \
    zsh-users/zsh-syntax-highlighting

# FZF Aesthetics (Matched to Oh My Posh Palette)
export FZF_DEFAULT_OPTS="--height=40% --layout=reverse --border=rounded --info=inline --prompt='❯ ' --pointer='▶ ' --marker='✓ ' --color=bg:-1,bg+:#262B44 --color=fg:#E0DEF4,fg+:#BD93F9 --color=hl:#4B95E9,hl+:#59C9A5 --color=info:#F8B34E,prompt:#BD93F9,pointer:#D81E5B --color=marker:#95C463,spinner:#F07623,header:#76ADCC"

# Completion Styling 
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'  # small letter matching
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" # color for completion
zstyle ':completion:*' menu no

# Force fzf-tab to explicitly use the exact same theme options
zstyle ':fzf-tab:*' fzf-flags --color=bg:-1,bg+:#262B44 --color=fg:#E0DEF4,fg+:#BD93F9 --color=hl:#4B95E9,hl+:#59C9A5 --color=info:#F8B34E,prompt:#BD93F9,pointer:#D81E5B --color=marker:#95C463,spinner:#F07623,header:#76ADCC --prompt='❯ ' --pointer='▶ ' --marker='✓ '

# Keybindings
bindkey -e                   
bindkey '^p' history-search-backward  # Native backward search (Ctrl+P)
bindkey '^n' history-search-forward   # Native forward search (Ctrl+N)
# Note: Ctrl+R is automatically bound to the fzf history search by the Zinit snippet above!

# History Setup
SAVEHIST=2000
HISTDUP=erase
HISTSIZE=2000                
HISTFILE=~/.zsh_history      
setopt share_history         
setopt append_history
setopt hist_ignore_space
setopt hist_ignore_all_dups 
setopt hist_ignore_dups      
setopt hist_save_no_dups 
setopt hist_find_no_dups

# Aliases
alias ls='ls --color'
alias ll='ls -la --color'
alias dots='cd ~/.dotfiles'
alias hypr-conf="nvim ~/.config/hypr/hyprland.conf"
alias ff="fastfetch"
alias c='clear'
alias devshell='~/Projects/Flakes/devshell_choice.sh'
alias bye='shutdown now'

# Shell Integrations
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Yazi
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

# Defaults
export EDITOR='nvim'
 
# Rustlings
export PATH="$HOME/.cargo/bin:$PATH"

# Force Truecolor
export COLORTERM=truecolor

# Lazy-Load NVM (Massive speedup)
export NVM_DIR="$HOME/.nvm"
zsh_lazy_load_nvm() {
    unset -f nvm node npm npx corepack 
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}
nvm()  { zsh_lazy_load_nvm; nvm "$@"; }
node() { zsh_lazy_load_nvm; node "$@"; }
npm()  { zsh_lazy_load_nvm; npm "$@"; }
npx()  { zsh_lazy_load_nvm; npx "$@"; }
