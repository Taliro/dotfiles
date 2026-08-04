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
      command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd ${pkgs.hyprland}/bin/start-hyprland";
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
