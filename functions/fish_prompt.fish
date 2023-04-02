function fish_prompt --description 'Write out the prompt'
	set -g RETVAL $status

	switch $FISH_PROMPT

		case min
			set_color 99F
			echo -n -s (prompt_pwd)
			if [ (jobs -l | wc -l) -ne 0 ]
				set_color f3f939
			end
			if [ $RETVAL -ne 0 ]
				set_color f74a3d
			end
			echo -n -s " % "
			set_color normal

		case '*'
			set -l code ''
			set -l jobs ''
			if [ $RETVAL -ne 0 ]
				set code '✘'
			end
			if [ (jobs -l | wc -l) -ne 0 ]
				set jobs '⚙'
			end
			set_color 777
			echo -n -s "["
			set_color f74a3d
			echo -n -s "$code"
			set_color f3f939
			echo -n -s "$jobs"
			set_color 777
			echo -n -s "] "
			set_color 9F9
			echo -n -s (date "+%H:%M") " "
			set_color 99F
			echo -n -s (prompt_pwd) " % "
			set_color normal

	end
end
