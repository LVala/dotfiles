set -g @fg "#deeeed"
set -g @bg "#242424"
set -g @muted "#7a7a7a"
set -g @left "#708090"
set -g @right "#7788aa"

set -g status on
set -g status-style "fg=#{@fg},bg=#{@bg}"
set -g status-left-length 100
set -g status-right-length 100

set -g window-status-style "fg=#{@muted},bg=#{@bg}"
set -g window-status-format " #I:#W#F"

set -g window-status-current-style "fg=#{@fg},bg=#{@bg}"
set -g window-status-current-format " #I:#W#F"

set -g status-left-style "fg=#{@bg},bg=#{@left},bold"
set -g status-left " #S "

set -g status-right-style "fg=#{@bg},bg=#{@right},bold"
set -g status-right "#{?client_prefix, PREFIX ,}"

set -g message-style "fg=#{@bg},bg=#{@left}"
set -g message-command-style "fg=#{@muted},bg=#{@bg}"
set -g mode-style "fg=#{@bg},bg=#{@left}"

set -g menu-style "fg=#{@muted}"
set -g menu-selected-style "fg=#{@bg},bg=#{@left}"
