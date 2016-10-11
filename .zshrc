#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#


# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
# cdr, add-zsh-hook を有効にする
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

 # cdr の設定
zstyle ':completion:*' recent-dirs-insert both
zstyle ':chpwd:*' recent-dirs-max 500
zstyle ':chpwd:*' recent-dirs-default true
zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/shell/chpwd-recent-dirs"
zstyle ':chpwd:*' recent-dirs-pushd true

if which trash-put &> /dev/null; then
	    alias rm='trash-put'
fi


bindkey -v
bindkey "\C-j" vi-cmd-mode
bindkey "^k" clear-screen
bindkey -M viins '\er' history-incremental-pattern-search-forward
bindkey -M viins '^?'  backward-delete-char
bindkey -M viins '^A'  beginning-of-line
bindkey -M viins '^B'  backward-char
bindkey -M viins '^D'  delete-char-or-list
bindkey -M viins '^E'  end-of-line
bindkey -M viins '^F'  forward-char
bindkey -M viins '^G'  send-break
bindkey -M viins '^H'  backward-delete-char
bindkey -M viins '^K'  kill-line
bindkey -M viins '^N'  down-line-or-history
bindkey -M viins '^P'  up-line-or-history
bindkey -M viins '^R'  history-incremental-pattern-search-backward
bindkey -M viins '^U'  backward-kill-line
bindkey -M viins '^W'  backward-kill-word
bindkey -M viins '^Y'  yank

alias cd..='cd ..'
alias rs='Rscript'
function peco-history-selection() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(history -n 1 | eval $tac | awk '!a[$0]++' | peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    # zle clear-screen
}
zle -N peco-history-selection

bindkey '^R' peco-history-selection
# Customize to your needs...
# source ~/.enhancd/enhancd.sh


alias pd='python -m ipdb'

# sonohoka
# zstyle ':prezto:module:syntax-highlighting' color 'yes'

function ptv(){
  local agfilepath
  agfilepath="$(echo $(find . | pt $@ | peco --query "$LBUFFER" | awk -F : '{print "+" $2 " \047" $1 "\047"}'))"
  if [ "$agfilepath" != "" ]; then
    eval $(echo "vim $agfilepath")
  fi
}
function ptvv(){
  local agfilepath
  agfilepath="$(echo $(pt $@ | peco --query "$LBUFFER" | awk -F : '{print "+" $2 " \047" $1 "\047"}'))"
  if [ "$agfilepath" != "" ]; then
    eval $(echo "vim $agfilepath")
  fi
}

export GOROOT=$HOME/.go
export PATH=$GOROOT/bin:$PATH
export GOPATH=$GOROOT/path
export PATH=$PATH:$GOPATH/bin

export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH

export PATH=/home/nakamura/bin:$PATH

source ~/.bettercd/setting.sh
export PATH=$PATH:$HOME/.local/bin
export VTE_CJK_WIDTH=1
alias markdown-pdf='\markdown-pdf -s ~/.mkd/github.css'

function extract() {
  case $1 in
    *.tar.gz|*.tgz) tar xzvf $1;;
    *.tar.xz) tar Jxvf $1;;
    *.zip) unzip $1;;
    *.lzh) lha e $1;;
    *.tar.bz2|*.tbz) tar xjvf $1;;
    *.tar.Z) tar zxvf $1;;
    *.gz) gzip -d $1;;
    *.bz2) bzip2 -dc $1;;
    *.Z) uncompress $1;;
    *.tar) tar xvf $1;;
    *.arj) unarj $1;;
  esac
}
alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz}=extract


export TERM="xterm-256color"
source /home/nakamura/.zprezto/modules/autosuggestions/external/zsh-autosuggestions.zsh
