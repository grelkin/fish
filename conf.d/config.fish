set EDITOR vi
set fish_greeting ""

set -x GOPATH "$HOME/go"

# pyenv
set -Ux PYENV_ROOT $HOME/.pyenv
set -Ux fish_user_paths $PYENV_ROOT/bin
status --is-interactive; and source (pyenv init -|psub)

# aliases
alias ls='exa --group-directories-first'
alias g='git'
alias ack='ag -i --hidden'
alias vf='vifm'
alias vi='nvim'
