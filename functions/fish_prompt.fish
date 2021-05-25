function fish_prompt --description 'Write out the prompt'
	set -g RETVAL $status

	# Just calculate these once, to save a few cycles when displaying the prompt
	if not set -q __fish_prompt_hostname
		set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
	end

	if not set -q __fish_prompt_normal
		set -g __fish_prompt_normal (set_color normal)
	end

	switch $USER

		case root

		if not set -q __fish_prompt_cwd
			if set -q fish_color_cwd_root
				set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
			else
				set -g __fish_prompt_cwd (set_color $fish_color_cwd)
			end
		end

		echo -n -s "$USER" @ "$__fish_prompt_hostname" ' ' "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal" '# '

		case '*'

		if not set -q __fish_prompt_cwd
			set -g __fish_prompt_cwd (set_color $fish_color_cwd)
		end

		set -l code ''
		set -l jobs ''
		if [ $RETVAL -ne 0 ]
			set code '✘'
		end
		if [ (jobs -l | wc -l) -gt 0 ]
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
		# echo -n -s "$USER" " "
		echo -n -s (date "+%H:%M") " "
		set_color 99F
		echo -n -s (prompt_pwd) " % "
		set_color normal

	end
end
