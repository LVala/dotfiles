########## BASH_PROFILE ##########

[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -d ~/bin ]] && PATH="$HOME/bin:$PATH"

# autostart X at login
if [["$(tty)" = "/dev/tty1" ]]; then
  pgrep i3 || exec startx
fi
