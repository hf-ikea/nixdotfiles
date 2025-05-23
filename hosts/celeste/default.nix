{ flake
, pkgs
, lib
, ...
}:
let
  inherit (flake.config) params;
in
{
  imports = [
    ./hardware-configuration.nix
    ../../config-module.nix
  ];
  params.hostname = lib.mkForce "celeste";
  params.username = lib.mkForce "emi";
  params.wallpaper = "/home/emi/nixos/wallpaper.png";

  # Bootloader.
  boot.loader = {
    grub = {
      enable = true;
      efiSupport = true;
      useOSProber = true;
      device = "nodev";
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
  };

  boot.blacklistedKernelModules = [
    "dvb_usb_rtl28xxu"
  ];

  environment.systemPackages = with pkgs; [
    ntfs3g
  ];
}
