# Clean
rmdir Desktop Downloads VirtualBox\ VMs/
mv ~/Screenshot*.png ~/dox/media/pix/PrtSc/
mv ~/*.mkv ~/dox/media/vids/
rm /home/javi/.lesshst
rm -r /home/javi/.w3m
clear

# $EDITOR="nvim"

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
# Not supported in the "fish" shell.
#(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
#cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
#source ~/.cache/wal/colors-tty.sh

# Nub's config ZSH

# PS1 and enable colors
autoload -U colors && colors
#PS1="%B%{$fg[white]%}%{$fg[cyan]%}%n%{$fg[yellow]%} at %{$fg[cyan]%}%M%{$fg[yellow]%}┐
#┌─[%t]─┘
#└[%~]%{$fg[white]%}%{$reset_color%} $%b "

#PS1="%B%{$fg[white]%}%{$fg[green]%}%n%{$fg[yellow]%}@%{$fg[cyan]%}%M%{$fg[yellow] [%~] $ "
#PS1="%B$fg[cyan] %~ $ "

PS1="%B%{$fg[yellow]%}[%{$fg[green]%}%n%{$fg[yellow]%}@%{$fg[cyan]%}%M %{$fg[yellow]%}%~%{$fg[yellow]%}]%{$reset_color%}$%b "

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

ls -A | wc -l


# Installation aliases
alias xi="sudo xbps-install -S"
alias xr="sudo xbps-remove -R"
alias xq="sudo xbps-query"
alias xU="sudo xbps-install -ySu"

#kb alias
alias ch="setxkbmap ch"
alias us="setxkbmap us"

# power aliases
alias pow="sudo poweroff"
alias reb="sudo reboot"
alias asdf="startx"

# file aliases
alias lA="ls -A"
alias ll="ls -l -h"
alias llA="ls -lA -h"
alias wl="ls -A | wc -l"
alias ..="cd .."

# LaTeX aliases
alias TX="cp /home/javi/dox/latex/doc/doc.tex"
alias xl="xelatex"
alias pl="pdflatex"
alias pkg="nvim ~/dox/pkg2"

# Programs
alias clock="tty-clock -S -s -c -C 6"
alias cal="calcurse"
alias SM="mw -Y;neomutt"
alias v="nvim"
alias am="alsamixer"
alias zzz="sudo zzz"
alias 120rate="xrandr --rate 120hz"
alias pomo="/home/javi/dox/sh/pomodoro.sh"

# conveniency aliases
alias weather="$HOME/dox/sh/other/weather.sh"
alias rpi="$HOME/dox/sh/other/ssh/1.sh"
alias liro="$HOME/dox/sh/other/ssh/living-room.sh"
alias kbr="$HOME/dox/sh/keyboard-remapping/commands"

# make
alias maek="sudo make clean install"

# go
export PATH=$PATH:/usr/local/go/bin
