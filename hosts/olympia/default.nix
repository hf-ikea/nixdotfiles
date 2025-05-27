{ flake
, pkgs
, ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ../../config-module.nix
  ];
  networking.hostName = "olympia";
  params.username = "iris";

  # Bootloader.
  boot.loader = {
    grub = {
      enable = true;
      efiSupport = true;
      useOSProber = false;
      device = "nodev";
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
  };

  services."06cb-009a-fingerprint-sensor" = {
    enable = true;
    #backend = "libfprint-tod";                                                
    #calib-data-file = ./calib-data.bin;                
  };
}
