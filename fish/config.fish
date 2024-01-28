# set paths for fisher plugins in order not to pollute config directory
set -gx fisher_path $__fish_user_data_dir
set fish_function_path $fish_function_path[1] $fisher_path/functions $fish_function_path[2..-1]
set fish_complete_path $fish_complete_path[1] $fisher_path/completions $fish_complete_path[2..-1]

for file in $fisher_path/conf.d/*.fish
    source $file
end

# environment
set -gx EDITOR nvim

# aliases
alias ls='ls --color=auto -Fh'
alias ll='ls -la'
alias t='tmuxify'

# bindings
bind \cF "cd (find $HOME/* -maxdepth 4 -type d -not -path '*/.*' | fzf) && commandline -f repaint"

if status is-interactive
    set fish_greeting 
    set_theme
end

# tool configuration, adding stuff to PATH 
fish_add_path $HOME/.cargo/bin
