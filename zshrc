# Enable Powerlevel10k instant prompt. Should stay close to the top of $HOME/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

#export NVM_DIR="$HOME/.nvm"
#. "$(brew --prefix nvm)/nvm.sh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="amuse"
#ZSH_THEME="powerlevel9k/powerlevel9k"
# ZSH_THEME="bullet-train"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $HOME/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $HOME/.oh-my-zsh/plugins/*
# Custom plugins may be added to $HOME/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git autopep8 command-not-found pip python web-search zsh-autosuggestions fast-syntax-highlighting k 
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR='vim'

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="$HOME/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate $HOME/.zshrc"
# alias ohmyzsh="mate $HOME/.oh-my-zsh"
# $HOME/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

#this is the stuff that was in my original /.bashrc, below

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
#setopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
HISTFILESIZE=200000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.
export SAVEHIST=$HISTSIZE

autoload -U compinit
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Enable approximate completions
#zstyle ':completion:*' completer _complete _ignored _approximate
zstyle -e ':completion:*:approximate:*' max-errors '3'
zstyle ':completion:*' menu select
zstyle ':completion:*' verbose true
# Smart matching of dashed values, e.g. f-b matching foo-bar
#zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*'
# Always use menu selection for `cd -`
zstyle ':completion:*:*:cd:*:directory-stack' force-list always
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
# Pretty messages during pagination
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
# Nicer format for completion messages
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:corrections' format '%U%F{green}%d (errors: %e)%f%u'
zstyle ':completion:*:warnings' format '%F{202}%BSorry, no matches for: %F{214}%d%b'
# Show message while waiting for completion
zstyle ':completion:*' show-completer true
# Prettier completion for processes
zstyle ':completion:*:*:*:*:processes' force-list always
zstyle ':completion:*:*:*:*:processes' menu yes select
zstyle ':completion:*:*:*:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,args -w -w"

# Enable tree view for kill completion
zstyle ':completion:*:*:kill:*:processes' command 'ps --forest -e -o pid,user,tty,cmd'


function _set-list-colors() { #this isnt a callable, dw
	zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
    unfunction _set-list-colors
}
sched 0 _set-list-colors  # deferred since LC_COLORS might not be available yet

# Use lf to switch directories and bind it to ctrl-o
function lfcd () { # use lf to go to a location
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
#setopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#setopt -s globstar

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

#dont do this for zsh
#if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi
#unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#    ;;
#*)
#    ;;
#esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r $HOME/.dircolors && eval "$(dircolors -b $HOME/.dircolors)" || eval "$(dircolors -b)"
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
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CFh'
alias lr='ls -ltrh' 
alias kr='k --sort time --reverse --no-vcs --human'
function lrr(){
    ls -ltrhF | tail -5 > /dev/stderr 
} 
alias lra='ls -ltrha'

EDITOR='vim'

function vimlr(){ #edit's the nth most recently modified file
     lineNum=$(lr | wc -l)
     getLine=$(expr $lineNum - $@ + 1)'p'
     file=$(lr | sed -n $getLine)
     split=$(echo $file | awk '{print $NF}')
     echo 'editing file '$split
     $EDITOR $split
 }

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# $HOME/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f $HOME/.bash_aliases ]; then
    . $HOME/.bash_aliases
fi

export HISTFILESIZE=20000
export HISTSIZE=10000
#setopt histappend
# Combine multiline commands into one in history
#setopt cmdhist
setopt appendhistory autocd nomatch autopushd pushdignoredups promptsubst

export PYTHONSTARTUP=$HOME/tools/python_terminal.py

function feh(){ # feh and print the path out of the current image when u hit 1
    if [[ $# -eq 0 ]]; then
        /usr/bin/feh --action1 "echo $PWD/%n" --keep-zoom-vp  
    else
        /usr/bin/feh --action1 "echo $PWD/%n" --keep-zoom-vp "$@" 
    fi
}

function clearpath(){ #reset python path to ""
	export PYTHONPATH=""
}

function fixscroll(){ #fix problem where scroll doesn't scroll up but just cycles thru recent commands
	tput rmcup
}

#custom aliases
alias python='/usr/bin/python3'
alias spyder='spyder3'
alias ppath='echo $PYTHONPATH'
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e" # does ps aux and searches for the next word in the command, and returns all hits. ex: psg bash returns all bash scripts currently running as detected in ps aux and displays just those lines
alias pycharm="bash $HOME/Downloads/pycharm-professional-2020.1/pycharm-2020.1/bin/pycharm.sh" 
alias imagej="$HOME/Downloads/ImageJ/ImageJ &"

#source $HOME/deep-rl-research/setup_env.bash 
#export PYTHONPATH=$PYTHONPATH:/home/alberba1/multiagent_particle_envs/ 
#export PYTHONPATH=$PYTHONPATH:/home/alberba1/maddpg

function up(){ #go up a certain amount of directories
  local d=""
  limit=$1
  for ((i=1 ; i <= limit ; i++))
    do
      d=$d/..
    done
  d=$(echo $d | sed 's/^\///')
  if [ -z "$d" ]; then
    d=..
  fi
  cd $d
}

function tma (){ #because tmux a -t name is annoying
    tmux a -t $@
}

function greplook () { #arg 1 is extension, ex: py, arg 2 is word in file
    if [[ $# == 2 ]]; then   
        grep -Rin --include \*."$1" "$2"
    else
        grep -Rin "$1" . #if one argument, search all files. 
    fi
}

function findf (){ # find file (exact name) recursively in my directory accepts regex
    find . -type f -name $@ 
}

#mount script
#	sudo umount -vlf /mnt/loc
#	sudo sshfs -o reconnect,allow_other,nonempty,IdentityFile=$HOME/.ssh/id_rsa,idmap=user raymond@raymond:/ /mnt/loc/ 

function findf (){ # find file (exact name) recursively in my directory accepts regex
    find . -type f -name $@ 
}

fixscroll(){
	tput rmcup
}

findfile (){
	find . -type f -name $@
}

function extract { #unzip shit so i dont have to remember 
 # tar -xyzvfabcdefghijklmnop in that order
  if [ -z "$1" ]; then
     # display usage if no parameters given
     echo "Usage: extract <path/file_name>.                                         <zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
     echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/      file_name_3.ext]"
     return 1
  else
     for n in $@
     do
       if [ -f "$n" ] ; then
           case "${n%,}" in
             *.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
                          tar -xvf "$n"       ;;
             *.lzma)      unlzma ./"$n"      ;;
             *.bz2)       bunzip2 ./"$n"     ;;
             *.rar)       unrar x -ad ./"$n" ;;
             *.gz)        gunzip ./"$n"      ;;
             *.zip)       zipfile="$n"
                          zipdir=${n%.zip}
                          unzip -d "$zipdir" "$zipfile"      ;;
             *.z)         uncompress ./"$n"  ;;
             *.7z|*.arj|*.cab|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.rpm|*.udf|*.wim|*.xar)
                          7z x ./"$n"        ;;
             *.xz)        unxz ./"$n"        ;;
             *.exe)       cabextract ./"$n"  ;;
             *)
                          echo "extract: '$n' - unknown archive method"
                          return 1
                          ;;
           esac
       else
           echo "'$n' - file does not exist"
           return 1
       fi
     done
 fi
 }

alias psg="ps aux | grep -v grep | grep -i -e VSZ -e" # does ps aux and         searches for the next word in the command, and returns all hits. ex: psg bash   returns all bash scripts currently running as detected in ps aux and displays   just those lines

mkcd (){
	mkdir $1 && cd $1
}

function pz(){ #print all zshrc functions
    grep "^function" $HOME/.zshrc | sort | cut -d' ' -f2- | grep "()" #grep "^function"
}

function lock(){
        gnome-screensaver-command -l
}

function tkill(){ #kills tmux session with specific name
    tmux kill-session -t $@
}

function tnew(){ # new tmux session with the input name
    tmux new -s $@
}

function vz(){
	vim $HOME/.zshrc
}

function sz(){
	source $HOME/.zshrc
}

function pp(){ #echo "$PYTHONPATH" > /dev/stderr
     echo "$PYTHONPATH" > /dev/stderr
 }
 
function ap(){ #append to the beginning of the python path
     if [[ $# == 0 ]]; then
         export PYTHONPATH=$PYTHONPATH:`pwd`
      else
         export PYTHONPATH=$PYTHONPATH:$1
      fi
 }

 function al(){ #append to the beginning of the LD_LIBRARY_PATH
      if [[ $# == 0 ]]; then
          export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:`pwd`
       else
          export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$1
       fi
  }

 function pl(){ #append to the beginning of the LD_LIBRARY_PATH
    echo $LD_LIBRARY_PATH >> /dev/stderr
 }

function clearld(){
    export LD_LIBRARY_PATH=/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64
}

function im2vid(){
    ffmpeg -framerate 60 -pattern_type glob -i "$@" -c:v libx264 -profile:v high -crf 20 -pix_fmt yuv420p output.mp4
}

function everyone(){ #change the file to chmod 777
    sudo chmod 777 $1
}

function itmine(){ #change the file owner to me
    sudo chown -R raymond:raymond $1
}

function fp(){ # get file path of the nth most recently updated file, and put it on the clipiboard
    if [ "$1" -eq "0" ]; then 
        echo `pwd` | xsel -i --clipboard
    fi
    lineNum=$(lr | wc -l)
    getLine=$(expr $lineNum - $@ + 1)'p'
    file=$(lr | sed -n $getLine)
    split=$(echo $file | awk '{print $NF}')
    echo `pwd`'/'$split 
    printf `pwd`'/'$split | xsel -i --clipboard
}

function vid2im(){
    mkdir _output_ims
    ffmpeg -i "$@" -r 60 -q:v 2 _output_ims/output_%09d.jpg
}

function autopy(){ #this does file formatting for python
    autopep8 --in-place --aggressive --aggressive --max-line-length=100 $1 #  > /dev/stderr
}

function v(){ # what will i do with all that time not needing the 'im' characters. this also concats all of the words into one title separated by underscored 
    if [[ $# -ne 1 ]]; then
        temp="$@"
        vim "${temp// /_}"
    else
        vim "$1"
        # if [[ $1 == *".py" ]]; then
        #     read -q "response?seems like a python file, wana autopep8 reformat? [y/N] "
        #         case "$response" in
        #             [yY][eE][sS]|[yY])
        #                  autopy $1
        #                  echo "autopep8ed."
        #                  ;;
        #             *)
        #                 echo
        #                 ;;
        #         esac
        # fi
    fi
}

function vt(){ # what will i do with all that time not needing the 'im' characters. this also concats all of the words into one title separated by underscored. this version also adds the date in the beginning of the file 
    if [[ $# -ne 1 ]]; then
        temp="$@"
        vim $(date +"%Y_%m_%d")_"${temp// /_}"
    else
        vim $(date +"%Y_%m_%d")_"$1"
    fi
}

function countem(){ #count how many items are in the current dir 
    echo $(ls -f | wc -l)
}

 function sros(){ #init ros setup from /opt/ros/kinetic
     cd /opt/ros/kinetic
     source setup.zsh
     cd -
 }


function vv(){ #edit vimrc
	vim $HOME/.vimrc
}

[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

function fv(){ #fzf and then vim that file
    v $(fzf)
}

function gpus(){ #compact display of gpu availability
     strout=$(nvidia-smi | grep " / ")
     echo "$strout"
 }

function weather(){
    curl v2.wttr.in > /dev/stderr 
    curl wttr.in > /dev/stderr
}

function please(){
     if [[ $# -eq 0 ]]; then
         sudo $(history | sed 's/^ *[0-9]* *//' | tail -1)
     else
         sudo "$@"
     fi
 }

 function fehr(){ # view most recent $1 images
     feh $(ls -t | head -$1)
 }

 function gimmeloop(){ #print out a foor loop
     loopvar="for i in \$(seq from incr til); do whatever \$i; done"
     echo "$loopvar" > /dev/stderr
     printf $loopvar | xsel -i --clipboard
 }

  function ffp(){ # get file path of the file, and put it on the    clipiboard

      split=$(echo $(fzf) | awk '{print $NF}')
      echo `pwd`'/'$split
      printf `pwd`'/'$split | xsel -i --clipboard
  }

function pack(){ #go to python3.5 packages
    cd /usr/local/lib/python3.5/dist-packages/
}

function store(){ #bigger file, use as clipboard, if 2 inputs, store item 1 in position 2 in clipboard. if 1 item, pull that storage item
    if [[ $# -eq 0 ]]; then
        echo "you need to copy or paste at least one thing"
    elif [[ $# -eq 1 ]]; then
        if [[ "$1" == "a" ]]; then # print everything
            tac /home/xury1/storage/storage.txt > /dev/stderr
        else
            sed "$1!d" /home/xury1/storage/storage.txt > /dev/stderr
        fi
    elif [[ $# -eq 2 ]]; then
        inp1="$1"
        if [[ "$1" == "f" ]]; then # use fzf to print a file name
            sed -i "$2i $(fzf)" /home/xury1/storage/storage.txt
        elif [[ "${inp1:0:2}" == "fp" ]]; then # use fzf to print a file name
            sed -i "$2i $(fp ${inp1:2:1})" /home/xury1/storage/storage.txt
        else
            sed -i "$2i $1" /home/xury1/storage/storage.txt
        fi
    else
        echo "takes 1 or 2 args. you are doing too many things"
    fi
}

export FZF_DEFAULT_OPTS="--layout=reverse --height 60%"

alias cb="xsel -i --clipboard"

function fixpip(){
    echo 'put this in /etc/pip.conf
    [global]
trusted-host = pypi.python.org
               pypi.org
               files.pythonhosted.org'
}

autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

 # Use lf to switch directories and bind it to ctrl-o
 function lfcd () { # use lf to go to a location, wget https://github.com/gokcehan/lf/releases/download/r6/lf-linux-amd64.tar.gz -O lf-linux-amd64.tar.gz
     tmp="$(mktemp)"
     lf -last-dir-path="$tmp" "$@"
     if [ -f "$tmp" ]; then
         dir="$(cat "$tmp")"
         rm -f "$tmp"
         [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
     fi
 }
 bindkey -s '^o' 'lfcd\n'

function xo () { #open up the current directory in xdg-open .
    xdg-open .
}



function annoserver (){ # go to the kmt anno server
    ssh -Y xury1@kmtannotator # also annotator acct, passwd = @NN0tat3
}

function theme (){
    v $HOME/.oh-my-zsh/custom/themes/bullet-train.zsh-theme
}

 function remove(){ # rm needs to be safer
     echo $(rm -dvI --one-file-system "$@") > /dev/stderr
 }

function journal () { # auto make a journal entry with the current name
    if [[ $# -eq 0 ]]; then
        cd $HOME/journal
    else
        temp="$@"
        v "$HOME/journal/"$(date +"%Y_%m_%d")"_${temp// /_}"
    fi
 }

function book () { # make a book review with the current name
    temp="$@"
    v "$HOME/journal/book_reviews/"$(date +"%Y_%m_%d")"_${temp// /_}"
}

function desk (){
    cd /c/Users/green/Desktop/
}

alias pip="pip3"

function sai (){ #sudo apt install
    sudo apt install "$@"
}

function spi () { #sudo pip3 install 
    sudo pip3 install "$@"
}

function sau() { # sudo apt update
    sudo apt update
}

alias bhost="browser-sync start --server --files ." # this hosts your website on localhost:3000

function deneread(){ # deneread gcp 
    gcloud beta compute ssh --zone "us-central1-a" "deneread" --project "deneread"
}

function denread(){
    # gcloud beta compute ssh --zone "us-central1-a" "denread" --project "deneread"
    gcloud beta compute ssh --zone "us-central1-a" "denread" --project "alien-trainer-257703"

}

function ddev(){
    gcloud beta compute ssh --zone "us-central1-a" "denread-dev" --project "deneread"
}

alias qrcp="$HOME/go/bin/qrcp"

# Load zsh-syntax-highlighting; should be last.
# source $HOME/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval $(thefuck --alias)

alias hackearth="$HOME/Downloads/eDEX-UI.Linux.x86_64.AppImage"

alias screenkey="$HOME/Downloads/screenkey/screenkey"

function elastic(){ # run elastic search
    $HOME/Downloads/elasticsearch-7.7.1/bin/elasticsearch 
}

# function bpytop(){ #python bpytop
#     python $HOME/bpytop/bpytop.py 
# }

function da(){ #deactivate
    deactivate
}

function s(){ # search inside files for something
    
    if [[ $# == 1 ]]; then  # by default; search everything
        rg -i -g "" "$1" -M 300 --max-columns-preview --stats > /dev/stderr
    elif [[ $# == 2 ]]; then  # search string, file type (ex: "*.py")
        rg -i -g "$2" "$1" -M 300 --max-columns-preview --stats > /dev/stderr
    elif [[ $# == 3 ]]; then  # search string, file type, max depth
        rg -i -g "$2" "$1" --max-depth "$3" -M 300 --max-columns-preview --stats > /dev/stderr
    else  # by default; search everything
        RED='\033[0;31m'
        NC="\033[0m" #no color
        echo "you ${RED}fool!${NC} search syntax is: s regex [file type] [depth (1 indexed)]"
    fi
}

# eval "$($HOME/anaconda3/bin/conda shell.zsh hook)"
# conda deactivate 

# To customize prompt, run `p10k configure` or edit $HOME/.p10k.zsh.
[[ ! -f $HOME/.p10k.zsh ]] || source $HOME/.p10k.zsh
source $HOME/powerlevel10k/powerlevel10k.zsh-theme

# not sure why on work laptop, fast syntax highlighting doesn't work
source $HOME/.oh-my-zsh/custom/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
