{ pkgs, ... }:

{
  imports = [
    # ./hardware-configuration.nix
    ./modules/nvidia.nix
    ./modules/audio.nix
    ./modules/hyprland.nix
    ./modules/networking.nix
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  networking.hostName = "taliro";
  
  users.users.taliro = {
    isNormalUser = true;
    description = "taliro";
    packages = with pkgs; [];
    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
      "render"
    ];
  };

  # Enable network
  networking.networkmanager.enable = true;

  # Set time zone
  time.timeZone = "Europe/Paris";

  # Select internalisation properties
  i18n.defaultLocale = "fr_FR.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "intl";
  };
  
  
  environment.systemPackages = with pkgs; [
    nil
    nixd
  ];

  
  programs.fish.enable = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];


  system.stateVersion = "26.05";
}
