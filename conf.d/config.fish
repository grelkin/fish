set EDITOR vi
set fish_greeting ""

set -x GOPATH "$HOME/go"

# pyenv
set -Ux PYENV_ROOT $HOME/.pyenv
set -Ux fish_user_paths $PYENV_ROOT/bin $fish_user_paths
