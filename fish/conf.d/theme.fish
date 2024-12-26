if status is-interactive
    set -gx FZF_DEFAULT_OPTS "
      --color=fg:#dddddd,hl:#7788aa
      --color=fg+:#deeeed,bg+:#444444,hl+:#7788aa
      --color=info:#708090,prompt:#deeeed,pointer:#deeeed
      --color=marker:#dddddd,spinner:#708090,header:#deeeed"

    set -g hydro_color_pwd 708090
    set -g hydro_color_git 7a7a7a
    set -g hydro_color_error ffaa88
    set -g hydro_color_prompt deeeed
    set -g hydro_color_duration 7a7a7a

    set -gx fish_color_end 7a7a7a
    set -gx fish_color_error ffaa88
    set -gx fish_color_quote 708090
    set -gx fish_color_param aaaaaa
    set -gx fish_color_option aaaaaa
    set -gx fish_color_normal CCCCCC
    set -gx fish_color_escape 789978
    set -gx fish_color_comment 555555
    set -gx fish_color_command CCCCCC
    set -gx fish_color_keyword 7a7a7a
    set -gx fish_color_operator 7788aa
    set -gx fish_color_redirection ffaa88
    set -gx fish_color_autosuggestion 555555
    set -gx fish_color_selection --background=555555
    set -gx fish_color_search_match --background=555555
    set -gx fish_pager_color_prefix 999999
    set -gx fish_pager_color_progress 555555
    set -gx fish_pager_color_completion cccccc
    set -gx fish_pager_color_description 7a7a7a
    set -gx fish_pager_color_selected_background --background=555555
end
