function tmuxify
    if test -n "$TMUX"
      echo 'Leave this sesh first buddy'
      return 1
    end

    if count $argv > /dev/null
        set -f name $argv[1]
    else
        set -f name (basename (pwd))
    end

    if tmux has-session -t=$name 2> /dev/null
        echo 'Name taken buddy, find a better one'
        return 1
    end

    tmux new-session -ds $name -n 'editor'
    # could pass as a argument to command above
    # but I want to be able to exit vim and not kill the window
    tmux send-keys -t $name "$EDITOR" Enter
    tmux new-window -dn 'terminal' -t "$name:"
    tmux attach-session -t $name
end
