function select_history
  history | fzf --no-sort | read foo
  if [ $foo ]
    commandline $foo
  else
    commandline ''
  end
end
