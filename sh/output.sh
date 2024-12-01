#! /bin/bash

get_icon() {
	local volume="$(pamixer --allow-boost --get-volume)"
	if [[ $(pactl list sources | grep "Active Port") =~ 'speaker' ]]; then
		if [[ $(pamixer --get-mute) == "false" ]]; then
			if (( $(pamixer --get-volume) < 33 )); then
				echo 󰕿
			elif (( 33 < ${volume} && ${volume} < 66 )); then
				echo 󰖀
			elif (( 66 < ${volume} )); then
				echo 󰕾
			fi
		else
			echo 󰝟
		fi
	else
		if [[ $(pamixer --get-mute) == 'false' ]]; then
			echo 󰋋
		else
			echo 󰟎
		fi
	fi
}

echo $(get_icon)
