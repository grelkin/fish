set EDITOR vi
set fish_greeting ""

# aliases
alias ls='exa --group-directories-first'
alias g='git'
alias ack='ag -i --hidden'
alias vf='vifm'
alias vi='nvim'

if command -v toolz > /dev/null
  status is-interactive; and source (toolz init fish | psub)
end
