alias e_a="emacs ~/.bashrc"
alias s_a="source ~/.bashrc"
alias ew="emacs -nw"
alias gs="git status"
alias gpom="git pull origin master"
alias fuckit="git fetch origin && git reset --hard origin/master && git clean -f -d"

# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh
