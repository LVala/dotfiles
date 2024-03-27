set -gx EDITOR nvim
set -gx tang_paths ~/repos/

if status is-interactive
    set fish_greeting

    # in TTY or already in tmux? don't run tang
    string match -q '/dev/tty*' (tty)
    or set -q TMUX || tang -e misc
end

zoxide init fish | source
