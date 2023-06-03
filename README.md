# dotfiles
My configuration files.

i3 - i3bar - i3status\
alacritty-neovim-doom emacs\
picom\
betterlockscreen -u "path-to-image"\
bash (TODO: zsh)\
rofi, dunst, cronie\
acpilight as xbacklight replacement

## Setup
cron: * * * * * /home/royce/.config/MyScripts/batterynotify\
Root cron: @reboot echo 60 > /sys/class/power_supple/BAT0/charge_control_end_threshold\
/etc/environment: XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
