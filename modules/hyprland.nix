{ pkgs, ... }:

{

  programs.hyprland.enable = true;

  xdg.portal = {

    enable = true;

    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
    ];

  };

  environment.systemPackages = with pkgs; [
    waybar

    rofi-wayland

    grim
    slurp

    wl-clipboard

    networkmanagerapplet

    mako
  ];

}
