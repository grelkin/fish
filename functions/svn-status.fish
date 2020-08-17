function svn-status --description "Colored SVN Status"
	s st $argv | awk '
	BEGIN {
		cpt_c=0;
	}
	{
		if        ($1=="C") {
			cpt_c=cpt_c+1;
			print "\033[1;31m" $0 "\033[00m";  # Conflicts are displayed in red
		}
		else if   ($1=="A") {
			print "\033[1;33m" $0 "\033[00m";  # Add in yellow
		}
		else if   ($1=="?") {
			print "\033[1;30m" $0 "\033[00m";  # New in cyan
		}
		else if   ($1=="D") {
			print "\033[1;35m" $0 "\033[00m";  # Delete in magenta
		}
		else if   ($1=="M") {
			print "\033[1;32m" $0 "\033[00m";    # Modified in green
		}
		else                {
			print $0;                        # No color, just print the line
		}
	}
	END {
		print cpt_c, " conflicts are found.";
	}
	'
end