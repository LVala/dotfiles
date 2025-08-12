{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    packages = import ./packages.nix;
    defaults = import ./defaults.nix;
    thisFlake = "/Users/lukasz/repos/dotfiles/nix";
    configuration = { pkgs, ... }: {
      nix = {
        gc.automatic = true;
        gc.options = "--delete-older-than 7d";
        settings.experimental-features = "nix-command flakes";
      };

      nixpkgs = {
        config.allowUnfree = true;
        config.allowBroken = true;
        hostPlatform = "aarch64-darwin";
      };

      environment = {
        systemPackages = packages.nix pkgs;
        shells = [ pkgs.fish ];
        shellInit = ''
          eval "$(/opt/homebrew/bin/brew shellenv)"
        '';
        shellAliases = {
          update = "nix flake update --flake ${thisFlake} && brew update";
          rebuild = "sudo darwin-rebuild switch --flake ${thisFlake}#lukasz-mbp";
        };
        variables = {
          EDITOR = "nvim";
        };
      };

      homebrew = {
        enable = true;
        casks = packages.casks;
        global.autoUpdate = false;
        onActivation = {
          autoUpdate = false;
          upgrade = true;
          cleanup = "zap";
        };
      };

      programs.fish.enable = true;

      fonts.packages = [
        (pkgs.iosevka-bin.override { variant = "SGr-IosevkaFixed"; })
      ];

      system = {
        primaryUser = "lukasz";
        configurationRevision = self.rev or self.dirtyRev or null;
        stateVersion = 6;

        keyboard.enableKeyMapping = true;
        keyboard.remapCapsLockToEscape = true;

        defaults = defaults;
      };

      networking.computerName = "Łukasz's MacBook Pro";
      networking.hostName = "lukasz-mbp";

      security.pam.services.sudo_local.touchIdAuth = true;
    };
  in
  {
    darwinConfigurations."lukasz-mbp" = nix-darwin.lib.darwinSystem {
      # TODO: https://github.com/hraban/mac-app-util
      modules = [ configuration ];
    };
  };
}
