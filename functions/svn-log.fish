function svn-log --description "Subversion log formatted"
	svn log -l 20 $argv | \
	perl -pe 's/\\n/ /g => s/^-.*/\\n/g' | \
    perl -pe 's/ \\d+ line[s]? //g' | \
	column -t -s "|" | \
	awk '{
		hash = "\\033[0;31m"$1"\\033[00m"
		time = "\\033[0;32m"$3" "$4"\\033[00m"
		author = "\\033[0;36m"$2"\\033[00m"

		text = ""
		for (i=10;i<=NF;i++){
			text = text" "$i
		}
		text = substr(text, 1, 90)

		# $output = "\\033[1;31m"$1"\\033[00m{\\033[32m<"$2">\\033[00m{";
		print hash"{"time"{"author"{"text;
	}'  | \
	column -t -s "{" | less -FXRS
end
