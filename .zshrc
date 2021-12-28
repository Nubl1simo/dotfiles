# Clean
rmdir Desktop Downloads VirtualBox\ VMs/
mv    ~/Screenshot*.png ~/dox/media/pix/PrtSc/
mv    ~/*.mkv ~/dox/media/videos/
rm    $HOME/.lesshst
rm -r $HOME/.w3m
clear

export EDITOR="nvim"
export TERM="st"
export VISUAL="nvim"

# PS1 and enable colors
autoload -U colors && colors
#PS1="%B%{$fg[yellow]%}[%{$fg[green]%}%n%{$fg[yellow]%}@%{$fg[cyan]%}%M %{$fg[yellow]%}%~%{$fg[yellow]%}]%{$reset_color%}$%b "
#PS1="%B%{$fg[magenta]%}[%{$fg[magenta]%}%n%{$fg[cyan]%}@%{$fg[magenta]%}%M %{$fg[cyan]%}%~%{$fg[magenta]%}]%{$reset_color%}$%b "
PS1="%B%{$fg[magenta]%}[%{$fg[magenta]%}%n%{$fg[white]%}@%{$fg[magenta]%}%M %{$fg[white]%}%~%{$fg[magenta]%}]%{$reset_color%}$%b "

# Put history in ~/.cache/ dir
HISTSIZE=3000
SAVEHIST=3000
HISTFILE=~/.cache/zsh/history

# Autocomplete and tab menu
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# vi mode
bindkey -v
export KEYTIMEOUT=1

# vi keys in tab menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'k' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new


# Syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
# source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null

ls -A | wc -l

# Installation aliases
alias xi="sudo pacman  -S"
alias xr="sudo pacman  -Runs"
alias xx="sudo pacman "
alias xU="sudo pacman -yuS"

#kb alias
alias ch="setxkbmap ch"
alias us="setxkbmap us"

# power aliases
alias pow="poweroff"
alias reb="reboot"
alias asdf="startx"

# file aliases
alias ls="ls --color"
alias lA="ls -A --color"
alias ll="ls -l -h --color"
alias llA="ls -lA -h --color"
alias wl="ls -A --color | wc -l"
alias ..="cd .."

# LaTeX aliases
alias TX="cp /home/javi/dox/latex/doc/doc.tex"
alias xl="xelatex"
alias pl="pdflatex"
alias pkg="nvim ~/dox/pkg2"

# Programs
alias clock="tty-clock -S -s -c -C 6"
# alias cal="calcurse"
alias SM="mw -Y;neomutt"
alias v="nvim"
alias z="zathura"
alias am="alsamixer"
alias zzz="sudo zzz"
alias vsync1="xrandr --output HDMI3 --mode 1920x1080"
alias 120rate="xrandr --rate 120hz"
alias 2mon="xrandr --output HDMI-3 --left-of HDMI-1"
alias pomo="/home/javi/dox/sh/pomodoro.sh"
alias speedread="/home/javi/dox/git/old/speedread/speedread"
alias todo="$HOME/dox/projects/Programming/bash/todo.sh"

# conveniency aliases
alias weather="$HOME/dox/sh/other/weather.sh"
alias rpi="$HOME/dox/sh/other/ssh/1.sh"
alias liro="$HOME/dox/sh/other/ssh/living-room.sh"
alias kbr="$HOME/dox/sh/keyboard-remapping/commands"
alias mus="cd $HOME/dox/media/mus/"

# make
alias maek="sudo make clean install"
