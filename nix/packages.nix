{
  nix = pkgs: with pkgs; [
    git
    delta
    neovim
	 # blame = delta
	 # TODO mouse scrolling
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
