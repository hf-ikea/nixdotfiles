{ flake
, pkgs
, ...
}:
let
  secretspath = builtins.toString flake.inputs.nix-secrets;
  inherit (flake.config) params;
in
{
  imports = [
    ./hardware-configuration.nix
    ../../config-module.nix
  ];
  networking.hostName = "olympia";
  params.username = "iris";

   home-manager.users.${params.username}.home = {
    packages = with pkgs; [
      mpv
      syncplay
    ];
  };

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
