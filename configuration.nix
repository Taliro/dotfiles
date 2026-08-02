{ pkgs, ... }:

{
  imports = [
    ./modules/nvidia.nix
    ./modules/audio.nix
    ./modules/hyprland.nix
    ./modules/networking.nix
  ];


  users.users.david = {
    isNormalUser = true;

    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
      "render"
    ];
  };


  programs.zsh.enable = true;


  environment.systemPackages =
  with pkgs;
  [
    git
    vim
  ];


  system.stateVersion = "26.05";
}
