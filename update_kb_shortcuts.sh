# hints from https://askubuntu.com/a/760958
# Primary == Control
# modifies ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml

#####################################################
# Command Overrides
#####################################################

# override -> true
xfconf-query --reset --channel xfce4-keyboard-shortcuts \
    --property "/commands/custom/override"
xfconf-query --create --channel xfce4-keyboard-shortcuts --type bool \
    --property "/commands/custom/override" \
    --set 'true'

# Alt+q -> /usr/bin/xterm
xfconf-query --reset --channel xfce4-keyboard-shortcuts \
    --property "/commands/custom/<Alt>q"
xfconf-query --create --channel xfce4-keyboard-shortcuts --type string \
    --property "/commands/custom/<Alt>q" \
    --set '/usr/bin/xterm'

# Alt+p -> /usr/bin/firefox
xfconf-query --reset --channel xfce4-keyboard-shortcuts \
    --property "/commands/custom/<Alt>p"
xfconf-query --create --channel xfce4-keyboard-shortcuts --type string \
    --property "/commands/custom/<Alt>p" \
    --set 'firefox'

# Alt+t -> /usr/bin/thunderbird
xfconf-query --reset --channel xfce4-keyboard-shortcuts \
    --property "/commands/custom/<Alt>t"
xfconf-query --create --channel xfce4-keyboard-shortcuts --type string \
    --property "/commands/custom/<Alt>s" \
    --set 'thunderbird'

# Alt+s -> /usr/bin/xflock4
xfconf-query --reset --channel xfce4-keyboard-shortcuts \
    --property "/commands/custom/<Alt>t"
xfconf-query --create --channel xfce4-keyboard-shortcuts --type string \
    --property "/commands/custom/<Alt>s" \
    --set 'xflock4'


#####################################################
# Window Manager Overrides
#####################################################

# override -> true
xfconf-query --reset --channel xfce4-keyboard-shortcuts \
    --property "/xfwm4/custom/override"
xfconf-query --create --channel xfce4-keyboard-shortcuts --type bool \
    --property "/xfwm4/custom/override" \
    --set 'true'

# Primary+Up -> raise_window_key
xfconf-query --reset --channel xfce4-keyboard-shortcuts \
    --property "/xfwm4/custom/<Primary>Up"
xfconf-query --create --channel xfce4-keyboard-shortcuts --type string \
    --property "/xfwm4/custom/<Primary>Up" \
    --set 'raise_window_key'

# Primary+Down -> lower_window_key
xfconf-query --reset --channel xfce4-keyboard-shortcuts \
    --property "/xfwm4/custom/<Primary>Down"
xfconf-query --create --channel xfce4-keyboard-shortcuts --type string \
    --property "/xfwm4/custom/<Primary>Down" \
    --set 'lower_window_key'

# Primary+Left -> left_workspace_key
xfconf-query --reset --channel xfce4-keyboard-shortcuts \
    --property "/xfwm4/custom/<Primary>Left"
xfconf-query --create --channel xfce4-keyboard-shortcuts --type string \
    --property "/xfwm4/custom/<Primary>Left" \
    --set 'left_workspace_key'

# Primary+Right -> right_workspace_key
xfconf-query --reset --channel xfce4-keyboard-shortcuts \
    --property "/xfwm4/custom/<Primary>Right"
xfconf-query --create --channel xfce4-keyboard-shortcuts --type string \
    --property "/xfwm4/custom/<Primary>Right" \
    --set 'right_workspace_key'

# Alt+XF86WakeUp -> resize_window_key
xfconf-query --reset --channel xfce4-keyboard-shortcuts \
    --property "/xfwm4/custom/<Alt>XF86WakeUp"
xfconf-query --create --channel xfce4-keyboard-shortcuts --type string \
    --property "/xfwm4/custom/<Alt>XF86WakeUp" \
    --set 'resize_window_key'

