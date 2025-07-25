{ flake
, pkgs
, ...
}:
let
  #secretspath = builtins.toString flake.inputs.nix-secrets;
  inherit (flake.config) params;
in
{
  imports = [
    ./hardware-configuration.nix
    ../../config-module.nix
  ];
  networking.hostName = "olympia";

  home-manager.users.${params.username}.home = {
    packages = with pkgs; [
      mpv
      syncplay

      cqrlog
      wsjtz
      tqsl
      fldigi
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

  hardware.rtl-sdr.enable = true;

  # services."06cb-009a-fingerprint-sensor" = {
  #   enable = true;
  #   backend = "libfprint-tod";
  #   calib-data-file = "${secretspath}/calib-data.bin";
  # };
}
