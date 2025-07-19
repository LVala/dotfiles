function tang
    set -l paths ~/repos/*
    set -l names (_tang_get_names $paths)

    set -l name (string join \n $names | fzf --tac) || return

    set idx (contains -i $name $names)
    and set -l dir $paths[$idx]
    or set -l dir (pwd)

    tmux has-session -t=$name 2>/dev/null || begin
        tmux new-session -ds $name -c $dir -n editor "fish -C $EDITOR"
        tmux new-window -dat "$name:" -c $dir
    end

    set -q TMUX
    and tmux switch-client -t $name
    or tmux attach-session -t $name
end

function _tang_get_names
    for path in $argv
        set -l name (path basename $path)
        set names $names $name
        echo $name
    end

    for name in (tmux list-sessions -F "#{session_name}" 2>/dev/null)
        contains $name $names
        or echo $name
    end
end
