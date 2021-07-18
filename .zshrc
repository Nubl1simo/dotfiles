# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/nub/.zshrc'

autoload -U compinit
compinit
# End of lines added by compinstall
autoload -U compinit
zstyle ':completion*:' menu select
compinit
_comp_options+=(globdots)

autoload -U colors && colors
#PS1="%B%{$fg[white]%}%{$fg[cyan]%}%n%{$fg[yellow]%}@%{$fg[cyan]%}%M %{$fg[yellow]%}%~%{$fg[white]%}%{$reset_color%}$%b "
 PS1="%B%{$fg[yellow]%}[%t]%{$fg[cyan]%} %~%{$fg[yellow]%} $ "

# PS1="%B%{$fg[white]%}%{$fg[cyan]%}%n%{$fg[yellow]%}@%{$fg[cyan]%}%M%{$fg[yellow]%}┐
# ┌──────────────┘
# └[%~]%{$fg[white]%}%{$reset_color%} $%b "

# ps1 notes
# %m -> hostname
# %@ -> time
# %n -> user's name

neofetch
#cd ~/dox/git/dwm
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
