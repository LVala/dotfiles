set -gx EDITOR nvim
set -gx tang_paths ~/repos/

if status is-interactive
    set fish_greeting
    set -q TMUX || tang misc
end
