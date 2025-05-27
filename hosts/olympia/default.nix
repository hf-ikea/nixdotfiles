{ flake
, pkgs
, ...
}:
let
  secretspath = builtins.toString flake.inputs.nix-secrets;
in
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
    backend = "libfprint-tod";
    calib-data-file = "${secretspath}/calib-data.bin";
  };
}
