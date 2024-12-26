set -gx EDITOR nvim
set -gx tang_paths ~/repos/

eval "$(/opt/homebrew/bin/brew shellenv)"
fish_add_path ~/bin

if status is-interactive
    set fish_greeting

    atuin init fish --disable-up-arrow | source

    alias ll="ls -lAh --color=auto"
    test -n "$TMUX" && alias clear="clear && tmux clear-history"

    set -q TMUX || tang misc
end
