set -g @fg "#deeeed"
set -g @bg "#242424"
set -g @muted "#7a7a7a"
set -g @blue "#7788aa"
set -g @lack "#708090"

set -g status on
set -g status-style "fg=#{@fg},bg=#{@bg}"
set -g status-left-length 100
set -g status-right-length 100

set -g window-status-style "fg=#{@muted},bg=#{@bg}"
set -g window-status-format " #I:#W#F"

set -g window-status-current-style "fg=#{@fg},bg=#{@bg}"
set -g window-status-current-format " #I:#W#F"

set -g status-left-style "fg=#{@bg},bg=#{@lack},bold"
set -g status-left " #S "

set -g status-right-style "fg=#{@bg},bg=#{@blue},bold"
set -g status-right "#{?client_prefix, PREFIX ,}"
