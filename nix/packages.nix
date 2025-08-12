{
  nix = pkgs: with pkgs; [
    git
    neovim
    fish
    tmux
    fzf
    ripgrep
    atuin
    starship
  ];

  casks = [
    "anki"
    "calibre"
    "discord"
    "docker-desktop"
    "ungoogled-chromium"
    "ghostty"
    "obsidian"
    "signal"
    "spotify"
    "whatsapp"
    "zoom"
  ];
}
