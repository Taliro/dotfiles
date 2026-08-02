{ pkgs, ... }:

{

  home.username = "david";

  home.homeDirectory = "/home/david";

  home.packages = with pkgs; [

    kitty

    helix

    eza

    bat

    fzf

    fd

    ripgrep

    direnv

    nix-direnv

    maple-mono.NF
  ];

  programs.git.enable = true;

  programs.direnv = {

    enable = true;

    nix-direnv.enable = true;

  };

  programs.zsh = {

    enable = true;

    shellAliases = {

      ll = "eza --icons --group-directories-first";

      la = "eza --icons -la";

      cat = "bat";

    };

  };

  home.file.".config/hypr/hyprland.conf".source = ./hyprland/hyprland.conf;

  home.file.".config/kitty/kitty.conf".source = ./kitty/kitty.conf;

  home.stateVersion = "26.05";

}
