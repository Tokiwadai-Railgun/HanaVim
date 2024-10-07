function update_unix {
	echo "Updating using unix architectiure"
}

function update_windows {
	echo "Updating using windows architecture"
}

windows_path="%userprofile%\\AppData\\local\\\nvim"
unix_path="~/.config/nvim"


case "$OSTYPE" in 
	linux*)
		echo $windows_path;;
	darwin*)
		echo $windows_path;;
	win*)
		update_windows;;
esac

