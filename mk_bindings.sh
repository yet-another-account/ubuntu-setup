#!/bin/bash
echo "Adding key bindings"
function x() {
    echo $1
}
function createShortcut() {
    name="$2"
    binding="$4"
    path="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom$1"
#    x "$3"
    dconf write "$path/name" "'""$name""'"
    dconf write "$path/command" "'""$3""'" #$(echo $3 | LC_ALL=C sed -e 's/[^a-zA-Z0-9,._+@%/-]/\\&/g; 1{$s/^$/""/}; 1!s/^/"/; $!s/$/"/')
    dconf write "$path/binding" "'""$binding""'"
}

# dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/binding '"<Primary><Shift>exclam"'
cp bin/screenshot $HOME
cp bin/screenshot_edit $HOME

bpath="/org/gnome/settings-daemon/plugins/media-keys"

dconf write "$bpath/screenshot" '""'
dconf write "$bpath/area-screenshot" '""'

createShortcut 0 'screenshot' "$HOME/screenshot" 'Print'
createShortcut 1 'screenshot+edit' "$HOME/screenshot_edit" '<Primary>Print'
ct=2

overallbindings=""
customindingPathPrefix="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom";

for (( i = 0 ; i < $ct; i++ ));
do
    overallbindings="$overallbindings, '$customindingPathPrefix$i/'"
done

overallbindings="[${overallbindings:2}]" # Delete the first 2 chars: " ," - space and comma
echo $overallbindings

# Update the list of bindings for the shortcuts to work
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings "$overallbindings"
# dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/']"
