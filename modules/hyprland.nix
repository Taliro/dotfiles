{ pkgs, ... }:

{

  programs.hyprland.enable = true;

  xdg.portal = {

    enable = true;

    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
    ];

  };

  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "${pkgs.hyprland}/bin/start-hyprland";
      user = "taliro";
    };
  };

  environment.systemPackages = with pkgs; [
    waybar

    rofi

    grim
    slurp

    wl-clipboard

    networkmanagerapplet

    mako
  ];

}
