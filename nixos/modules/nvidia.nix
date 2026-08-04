{ pkgs, ... }:

{

hardware.graphics.enable = true;


hardware.nvidia = {

  modesetting.enable = true;

  powerManagement.enable = true;

  nvidiaSettings = true;

  open = false;
};


services.xserver.videoDrivers =
[
  "nvidia"
];

}
