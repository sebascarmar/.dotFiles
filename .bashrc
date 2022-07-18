# Add this lines at the top of .bashrc:
[[ $- == *i* ]] && source ~/.local/share/blesh/ble.sh --noattach






# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples


# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


######################################################################################################
####                             VARIABLES DE ENTORNO                                             ####
######################################################################################################

export aSSySS=/home/sebastian/Documents/UTN/2doNivel/AnálisisDeSeñalesYSistemas
export tD1=/home/sebastian/Documents/UTN/3erNivel/TecnicasDigitales1
export tC1=/home/sebastian/Documents/UTN/3erNivel/TeoríaDeLosCircuitos
export leg=/home/sebastian/Documents/UTN/3erNivel/Legislación
export mE=/home/sebastian/Documents/UTN/3erNivel/MediosDeEnlace
export eA1=/home/sebastian/Documents/UTN/3erNivel/ElectrónicaAplicada1
export dE=/home/sebastian/Documents/UTN/3erNivel/DispositivosElectrónicos
export cuarto=/home/sebastian/Documents/UTN/4toNivel
export ea2=/home/sebastian/Documents/UTN/4toNivel/ElectronicaAplicada2
export mEIE=/home/sebastian/Documents/UTN/4toNivel/MaquinasEInstElectricas
export sEHI=/home/sebastian/Documents/UTN/4toNivel/SeguridadEHigieneInd
export sC=/home/sebastian/Documents/UTN/4toNivel/SistemasDeComunicaciones
export tD2=/home/sebastian/Documents/UTN/4toNivel/TecnicasDigitales2
export tC2=/home/sebastian/Documents/UTN/4toNivel/TeoriaDeLosCircuitos2

export cura412=/home/sebastian/Downloads/AppImage/Ultimaker_Cura-4.12.1.AppImage
export cura480=/home/sebastian/Downloads/AppImage/Ultimaker_Cura-4.8.0.AppImage


######################################################################################################
####                                     POWERLINE                                                ####
######################################################################################################
# This was added for installing Powerline
#export TERM=”screen-256color” 

#powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
#. /usr/local/lib/python3.8/dist-packages/powerline/bindings/bash/powerline.sh


######################################################################################################
####                               FUZZY FINDER                                                   ####
######################################################################################################

[ -f ~/.fzf.bash ] && source ~/.fzf.bash


#### This is the configuration for fuzzy finder #### 
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --inline-info --multi
                        --preview="bat --theme=TwoDark --style=full --color=always {}" 
                        --preview-window='right:hidden:wrap' 
                        --bind=f2:toggle-preview,ctrl-d:preview-page-down,ctrl-u:preview-page-up,ctrl-u:preview-down,ctrl-i:preview-up'


FD_OPTIONS="--hidden --follow --exclude .git --exclude node_modules"
export FZF_DEFAULT_COMMAND="git ls-files --cached --others --exclude-standard | fd --type f --type l $FD_OPTIONS"
export FZF_CTRL_T_COMMAND="fd $FD_OPTIONS"
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

### This is a key map: CTRL-T = CTRL-p
  # CTRL-p - Paste the selected file path into the command line
  bind -m emacs-standard -x '"\C-p": fzf-file-widget'
  bind -m vi-command -x '"\C-p": fzf-file-widget'
  bind -m vi-insert -x '"\C-p": fzf-file-widget'



#### COLORES ####

#export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
# --color=fg:#cbccc6,bg:#1f2430,hl:#707a8c
# --color=fg+:#707a8c,bg+:#191e2a,hl+:#ffcc66
# --color=info:#73d0ff,prompt:#707a8c,pointer:#cbccc6
# --color=marker:#73d0ff,spinner:#73d0ff,header:#d4bfff'

# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
#--color fg:#D8DEE9,bg:#2E3440,hl:#A3BE8C,fg+:#D8DEE9,bg+:#434C5E,hl+:#A3BE8C
#--color pointer:#BF616A,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B
#'

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=dark
--color=fg:-1,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#4b5263,hl+:#d858fe
--color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef
'

#export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
#--color fg:242,bg:233,hl:65,fg+:15,bg+:234,hl+:108
#--color info:108,prompt:109,spinner:108,pointer:168,marker:168
#'

#### SCRIPTS ####

## Run command/application and choose paths/files with fzf.                      
## Always return control of the terminal to user (e.g. when opening GUIs).       
## The full command that was used will appear in your history just like any      
## other (N.B. to achieve this I write the shell's active history to             
## ~/.bash_history)                                                                
##                                                                               
## Usage:
## f cd [OPTION]... (hit enter, choose path)
## f cat [OPTION]... (hit enter, choose files)
## f vim [OPTION]... (hit enter, choose files)
## f vlc [OPTION]... (hit enter, choose files)
#
#f() {
#    # Store the program
#    program="$1"
#
#    # Remove first argument off the list
#    shift
#
#    # Store option flags with separating spaces, or just set as single space
#    options="$@"
#    if [ -z "${options}" ]; then
#        options=" "
#    else
#        options=" $options "
#    fi
#
#    # Store the arguments from fzf
#    arguments="$(fzf --multi)"
#
#    # If no arguments passed (e.g. if Esc pressed), return to terminal
#    if [ -z "${arguments}" ]; then
#        return 1
#    fi
#
#    # We want the command to show up in our bash history, so write the shell's
#    # active history to ~/.bash_history. Then we'll also add the command from
#    # fzf, then we'll load it all back into the shell's active history
#    history -w
#
#    # ADD A REPEATABLE COMMAND TO THE BASH HISTORY ############################
#    # Store the arguments in a temporary file for sanitising before being
#    # entered into bash history
#    : > /tmp/fzf_tmp
#    for file in "${arguments[@]}"; do
#        echo "$file" >> /tmp/fzf_tmp
#    done
#
#    # Put all input arguments on one line and sanitise the command by putting
#    # single quotes around each argument, also first put an extra single quote
#    # next to any pre-existing single quotes in the raw argument
#    sed -i "s/'/''/g; s/.*/'&'/g; s/\n//g" /tmp/fzf_tmp
#
#    # If the program is on the GUI list, add a '&' to the command history
#    if [[ "$program" =~ ^(nautilus|zathura|evince|vlc|eog|kolourpaint)$ ]]; then
#        sed -i '${s/$/ \&/}' /tmp/fzf_tmp
#    fi
#
#    # Grab the sanitised arguments
#    arguments="$(cat /tmp/fzf_tmp)"
#
#    # Add the command with the sanitised arguments to our .bash_history
#    echo $program$options$arguments >> ~/.bash_history
#
#    # Reload the ~/.bash_history into the shell's active history
#    history -r
#
#    # EXECUTE THE LAST COMMAND IN ~/.bash_history #############################
#    fc -s -1
#
#    # Clean up temporary variables
#    rm /tmp/fzf_tmp
#}




## fd - cd to selected directory
#fd() {
#  local dir
#  dir=$(find ${1:-.} -path '*/\.*' -prune \
#                  -o -type d -print 2> /dev/null | fzf +m) &&
#  cd "$dir"
#}



## fda - including hidden directories
#fda() {
#  local dir
#  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
#}
#
## cf - fuzzy cd from anywhere
## ex: cf word1 word2 ... (even part of a file name)
## zsh autoload function
#cf() {
#  local file
#
#  file="$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1)"
#
#  if [[ -n $file ]]
#  then
#     if [[ -d $file ]]
#     then
#        cd -- $file
#     else
#        cd -- ${file:h}
#     fi
#  fi
#}



## cdf - cd into the directory of the selected file
#cdf() {
#   local file
#   local dir
#   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
#}



#PODRIA HABER FUNCIONADO. ES UN cd INTERACTIVO
#function cd() {
#    if [[ "$#" != 0 ]]; then
#        builtin cd "$@";
#        return
#    fi
#    while true; do
#        local lsd=$(echo ".." && ls -p | grep '/$' | sed 's;/$;;')
#        local dir="$(printf '%s\n' "${lsd[@]}" |
#            fzf --reverse --preview '
#                __cd_nxt="$(echo {})";
#                __cd_path="$(echo $(pwd)/${__cd_nxt} | sed "s;//;/;")";
#                echo $__cd_path;
#                echo;
#                ls -p --color=always "${__cd_path}";
#        ')"
#        [[ ${#dir} != 0 ]] || return 0
#        builtin cd "$dir" &> /dev/null
#    done
#}


######################################################################################################
####                                 RIPGREP                                                      ####
######################################################################################################
##!/usr/bin/env bash
#
## 1. Search for text in files using Ripgrep
## 2. Interactively restart Ripgrep with reload action
## 3. Open the file in Vim
#RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case "
#INITIAL_QUERY="${*:-}"
#IFS=: read -ra selected < <(
#  FZF_DEFAULT_COMMAND="$RG_PREFIX $(printf %q "$INITIAL_QUERY")" \
#  fzf --ansi \
#      --disabled --query "$INITIAL_QUERY" \
#      --bind "change:reload:sleep 0.1; $RG_PREFIX {q} || true" \
#      --delimiter : \
#      --preview 'bat --color=always {1} --highlight-line {2}' \
#      --preview-window 'up,60%,border-bottom,+{2}+3/3,~3'
#)
#[ -n "${selected[0]}" ] && vim "${selected[0]}" "+${selected[1]}"

#bind 'set show-all-if-ambiguous on'
#bind 'TAB:menu-complete'

######################################################################################################
####                                AGNOSTER THEME                                                ####
######################################################################################################
export THEME=$HOME/.bash/themes/agnoster-bash/agnoster.bash
if [[ -f $THEME ]]; then
    export DEFAULT_USER=`whoami`
    source $THEME
fi

set +o vi

# Add this line at the end of .bashrc:
[[ ${BLE_VERSION-} ]] && ble-attach
