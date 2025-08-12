if status is-interactive
    set fish_greeting

    test -n "$TMUX" && alias clear="clear && tmux clear-history"

    starship init fish | source
    atuin init fish --disable-up-arrow | source
end
