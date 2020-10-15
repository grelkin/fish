function gr --description "Changes current directory to the git project root"
  cd (git git rev-parse --show-toplevel)
end
