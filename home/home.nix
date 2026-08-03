{ pkgs, ... }:

{

  home.username = "taliro";

  home.homeDirectory = "/home/taliro";

  home.packages = with pkgs; [
    git

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

    lazygit

    firefox
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

  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    x11.enable = true;

    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 14;
  };

  home.file.".config/hypr/hyprland.lua".source = ./hyprland/hyprland.lua;

  home.file.".config/kitty/kitty.conf".source = ./kitty/kitty.conf;

  home.file.".config/waybar/config.jsonc".source = ./waybar/config.jsonc;
  home.file.".config/waybar/style.css".source = ./waybar/style.css;
  
  home.stateVersion = "26.05";

}
