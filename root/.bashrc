alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias lsc='ls -phFG --color=auto'
alias l='lsc -l'
alias ll='l -a'
alias llt='ll -tr'
alias lls='ll -Sr'

alias tarc='tar cvf'
alias tarcz='tar czvf'
alias tarx='tar xvf'
alias tarxz='tar xvzf'

alias g='git'
alias less='less -R'
alias os='lsb_release -a'
alias vi='vim'

# Colorize grep
if echo hello|grep --color=auto l >/dev/null 2>&1; then
  export GREP_COLOR="1;31"
  alias grep='grep --color=auto'
fi

# Shell
export CLICOLOR="1"
if [ -f $HOME/.scripts/git-prompt.sh ]; then
  source $HOME/.scripts/git-prompt.sh
  export GIT_PS1_SHOWDIRTYSTATE="1"
  export PS1="\[\033[40m\]\[\033[34m\][ \u@\H:\[\033[36m\]\w\$(__git_ps1 \" \[\033[35m\]{\[\033[32m\]%s\[\033[35m\]}\")\[\033[34m\] ]$\[\033[0m\] "
else
  export PS1="\[\033[40m\]\[\033[34m\][ \u@\H:\[\033[36m\]\w\[\033[34m\] ]$\[\033[0m\] "
fi

export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=1;40:bd=34;40:cd=34;40:su=0;40:sg=0;40:tw=0;40:ow=0;40:"

# Aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Git
source $HOME/.scripts/git-completion.sh

# Z
source $HOME/.scripts/z.sh
