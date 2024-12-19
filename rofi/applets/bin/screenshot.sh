# Import Current Theme
source "$HOME"/.config/rofi/applets/shared/theme.bash
theme="$type/$style"

# Theme Elements
prompt='Screenshot'
mesg="DIR: `xdg-user-dir PICTURES`/Screenshots"

if [[ "$theme" == *'type-1'* ]]; then
	list_col='1'
	list_row='5'
	win_width='400px'
elif [[ "$theme" == *'type-3'* ]]; then
	list_col='1'
	list_row='5'
	win_width='120px'
elif [[ "$theme" == *'type-5'* ]]; then
	list_col='1'
	list_row='5'
	win_width='520px'
elif [[ ( "$theme" == *'type-2'* ) || ( "$theme" == *'type-4'* ) ]]; then
	list_col='5'
	list_row='1'
	win_width='670px'
fi

# Options
layout=`cat ${theme} | grep 'USE_ICON' | cut -d'=' -f2`
if [[ "$layout" == 'NO' ]]; then
	option_1=" Capture Desktop"
	option_2=" Capture Area"
	option_3=" Capture Window"
	option_4=" Copy Area to Clipboard"
	option_5=" Capture in 8s"
else
	option_1=""
	option_2=""
	option_3=""
	option_4=""
	option_5=""
fi

# Rofi CMD
rofi_cmd() {
	rofi -theme-str "window {width: $win_width;}" \
		-theme-str "listview {columns: $list_col; lines: $list_row;}" \
		-theme-str 'textbox-prompt-colon {str: " ";}' \
		-dmenu \
		-p "$prompt" \
		-mesg "$mesg" \
		-markup-rows \
		-theme ${theme}
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$option_1\n$option_2\n$option_3\n$option_4\n$option_5" | rofi_cmd
}

# Screenshot directory
time=$(date +%Y-%m-%d-%H-%M-%S)
geometry=$(xrandr | grep 'current' | head -n1 | cut -d',' -f2 | tr -d '[:blank:],current')
dir="`xdg-user-dir PICTURES`/Screenshots"
file="$dir/Screenshot_${time}_${geometry}.png"

# Create the Screenshots folder if it doesn't exist
if [[ ! -d "$dir" ]]; then
	mkdir -p "$dir"
fi

# Save screenshot to specified location
save_shot () {
	hyprshot -m output --output-folder "$dir" --filename "$(basename "$file")"
}

# Save selected area to directory
save_area () {
	hyprshot -m region --output-folder "$dir" --filename "$(basename "$file")"
}

# Copy selected area to clipboard
copy_area_clipboard () {
	hyprshot -m region --clipboard-only
}

# Take shots
shotnow () {
	save_shot
}

shotwin () {
	hyprshot -m window --output-folder "$dir" --filename "$(basename "$file")"
}

# Capture in 8 seconds (sleep 8 and run hyprshot)
shot8sec () {
	sleep 8
	hyprshot -m output --output-folder "$dir" --filename "$(basename "$file")"
}

# Execute Command
run_cmd() {
	case "$1" in
		--opt1) shotnow ;;
		--opt2) save_area ;;  # Save selected area to directory
		--opt3) shotwin ;;
		--opt4) copy_area_clipboard ;;  # Copy selected area to clipboard
		--opt5) shot8sec ;;  # Capture after sleeping for 8 seconds
	esac
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $option_1) run_cmd --opt1 ;;
    $option_2) run_cmd --opt2 ;;
    $option_3) run_cmd --opt3 ;;
    $option_4) run_cmd --opt4 ;;
    $option_5) run_cmd --opt5 ;;
esac

