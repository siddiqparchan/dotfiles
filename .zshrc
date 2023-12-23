# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#Dari Luke Smith
####################################################################
# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

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
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.
###########################################################################3
#Dari Luke Smith Selesai


#environment
export QT_QPA_PLATFORMTHEME=qt5ct
export PATH="$PATH:/home/diq/.local/bin"
#aliases
#alias yt-dlp="pipx run yt-dlp"
alias poweroff="systemctl poweroff"
alias reboot="systemctl reboot"
alias suspend=" light -S 0
                systemctl suspend 
                swaylock"
alias ls="ls --color=auto"

#powerlevel9k
source /usr/share/powerlevel9k/powerlevel9k.zsh-theme
#custom
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_DISABLE_RPROMPT=false
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="↳ "
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_elementary_icon dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status node_version command_execution_time)
POWERLEVEL9K_NODE_VERSION_BACKGROUND='seagreen1'
POWERLEVEL9K_NODE_VERSION_FOREGROUND='grey30'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='pink1'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='grey30'
POWERLEVEL9K_CUSTOM_ELEMENTARY_ICON="echo  `whoami` "
POWERLEVEL9K_CUSTOM_ELEMENTARY_ICON_BACKGROUND='green'
POWERLEVEL9K_CUSTOM_ELEMENTARY_ICON_FOREGROUND='grey30'
POWERLEVEL9K_VCS_GIT_GITHUB_ICON=$'\uF408 '
ZSH_DISABLE_COMPFIX=true

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

neofetch
