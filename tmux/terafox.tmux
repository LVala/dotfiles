set -g @fg "#e6eaea";
set -g @bg "#0f1c1e";
set -g @muted "#587b7b";
set -g @red "#ad5c7c";
set -g @green "#7aa4a1";

set -g status on
set -g status-style "fg=#{@fg},bg=#{@bg}"
set -g status-left-length 100
set -g status-right-length 100

set -g window-status-style "fg=#{@muted},bg=#{@bg}"
set -g window-status-format " #I:#W#F"

set -g window-status-current-style "fg=#{@fg},bg=#{@bg}"
set -g window-status-current-format " #I:#W#F"

set -g status-left-style "fg=#{@bg},bg=#{@green},bold"
set -g status-left " #S "

set -g status-right-style "fg=#{@bg},bg=#{@red},bold"
set -g status-right "#{?client_prefix, PREFIX ,}"
