function svn-diff --description "Colored and Lessed Svn diff"
	s diff $argv | colordiff | less -FXRS
end