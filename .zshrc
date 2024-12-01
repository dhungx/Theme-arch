# Cấu hình lịch sử
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
HISTCONTROL=ignoredups:erasedups
setopt hist_ignore_all_dups
setopt hist_save_no_dups

# Cài đặt hoàn thành và hiển thị thông tin
autoload -Uz compinit
compinit -C
clear && fastfetch

# Aliases
alias c='quich'
alias calc='quich'
alias ff='clear && fastfetch'
alias update='sudo pacman -Syu'
alias uninstall='sudo pacman -R'
alias home='cd ~'
alias update-all='sudo pacman -Syu && yay -Syu'
alias cleanup='sudo pacman -Rns $(pacman -Qdtq)'

# Starship Prompt
eval "$(starship init zsh)"
