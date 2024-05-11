if status is-interactive
    # hydro prompt
    set -g hydro_color_pwd 7aa4a1
    set -g hydro_color_git 6d7f8b
    set -g hydro_color_error e85c51
    set -g hydro_color_prompt fda47f
    set -g hydro_color_duration 6d7f8b

    # fzf
    set -gx FZF_DEFAULT_OPTS "
      --color=fg:#cbd9d8,hl:#b97490
      --color=fg+:#e6eaea,bg+:#254147,hl+:#ad5c7c
      --color=info:#688b89,prompt:#fda47f,pointer:#89aeb8
      --color=marker:#a1cdd8,spinner:#8eb2af,header:#8eb2af"

    # actual theme
    fish_config theme choose terafox
end
