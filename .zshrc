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

# Zinit Source after Downloading the first time
source "${ZINIT_HOME}/zinit.zsh"
source ~/.local/share/zinit/plugins/Aloxaf---fzf-tab/fzf-tab.zsh

# Zinit Add Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab
autoload -U compinit && compinit #(make this mannual in nix)

# Completion Styling 
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'  #small letter matching
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" #color for completion
zstyle ':completion:*' menu no

# Keybindings
bindkey -e              	 #set emacs keybindings(already similar set in nix)
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History Setup
SAVEHIST=2000
HISTDUP=erase
HISTSIZE=2000                           #(already set in nix)
HISTFILE=~/.zsh_history                 #(already set in nix)
setopt share_history 			        #(already set in nix)
setopt append_history
setopt hist_ignore_space
setopt hist_ignore_all_dups 
setopt hist_ignore_dups                 #(already set in nix)
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
