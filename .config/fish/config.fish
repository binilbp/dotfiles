function fish_greeting
    #enter something to display over every terminal launch
end
if status is-interactive

    abbr -a dots 'cd ~/.dotfiles; git status'                           
    abbr -a bat 'batcat --theme "Dracula"'
    abbr -a update 'sudo apt update; apt list --upgradable | batcat --file-name "Packages to Update" --theme "Dracula"'

    # clearing screen updated to fake clear
    abbr -a c 'printf "\e[H\e[22J"'
    abbr -a clear 'printf "\e[H\e[22J"'

    starship init fish | source
    enable_transience
end
