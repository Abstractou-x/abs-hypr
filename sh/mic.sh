#!/bin/bash

volume="$(pamixer --get-volume)"

get_icon() {
	if [[ $(pamixer --default-source --get-mute) == "false" ]]; then
		if (( $(pamixer --default-source --get-volume) > 20 )); then
			echo 󰢴
		else
			echo 󰍬
		fi
	else
		echo 󰍭
	fi
}

echo $(get_icon)

