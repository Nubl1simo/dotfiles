export EDITOR="nvim"
export TERM="st"
export VISUAL="nvim"

# PS1 and enable colors
autoload -U colors && colors
# PS1="%B%{$fg[blue]%}[%{$fg[blue]%}%n%{$fg[white]%}@%{$fg[blue]%}%M %{$fg[white]%}%~%{$fg[blue]%}]%{$reset_color%}$%b "
if [[ $(whoami) == "root" ]]; then
	PS1="%B%{$fg[red]%}[%{$fg[red]%}%n%{$fg[white]%}@%{$fg[red]%}%M %{$fg[white]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
else
	PS1="%B%{$fg[blue]%}[%{$fg[blue]%}%n%{$fg[white]%}@%{$fg[blue]%}%M %{$fg[white]%}%~%{$fg[blue]%}]%{$reset_color%}$%b "
fi

# Put history in ~/.cache/ dir
SAVEHIST=0
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


# Installation aliases
alias xi="doas pacman -S"
alias xr="doas pacman -Runs"
alias xx="doas pacman"
alias xU="doas pacman -ySu"

#kb alias
alias ch="setxkbmap ch"
alias us="setxkbmap us"

# power aliases
alias pow="sudo poweroff"
alias reb="reboot"
alias asdf="startx"

# file aliases
alias ls="ls --color"
alias ls-="ls"
alias la="ls -A --color"
alias ll="ls -lA -h --color"
alias wl="ls -A --color | wc -l"
alias ..="cd .."
alias lb="cd ~/.local/bin"

# LaTeX aliases
alias TX="cp $HOME/dox/latex/doc/doc.tex"
alias xl="xelatex"
alias pl="pdflatex"
alias pkg="nvim $HOME/dox/etc/pkg"

# Programs
alias clock="tty-clock -S -s -c -C 6"
alias SM="mw -Y;neomutt"
alias v="nvim"
alias z="setsid zathura"
alias am="alsamixer"
alias pm="pulsemixer"
alias km="kmix"
alias zzz="doas zzz"
alias moc="mocp -O MOCDir=\"~/.config\"/moc"

# conveniency aliases
alias rpi="1.sh"
alias liro="living-room.sh"
alias mus="cd $HOME/dox/media/mus/"
alias s="setsid -f"
alias reload="xrdb ~/.config/.Xresources"
alias obs="LIBGL_ALWAYS_SOFTWARE=1 setsid -f obs"
alias webcam="mpv av://v4l2:/dev/video0 --profile=low-latency --untimed"
alias pv="pipe-viewer --resolution 480"

# make
alias mci="doas make clean install"

# external hdd
alias ele="sudo mkdir /run/media/$USER/ /run/media/$USER/Elements && sudo mount /dev/sdb1 /run/media/$USER/Elements && cd /run/media/$USER/Elements"
alias cdE="cd /run/media/$USER/Elements"

# Syntax highlighting
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
