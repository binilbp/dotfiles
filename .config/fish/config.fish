function fish_greeting
    #enter something to display over every terminal launch
end
if status is-interactive
    abbr -a dots 'cd ~/.dotfiles; git status'
    abbr -a c 'printf "\e[H\e[22J"'
    abbr -a clear 'printf "\e[H\e[22J"'

    starship init fish | source
end
