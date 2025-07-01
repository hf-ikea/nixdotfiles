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
  params.username = lib.mkForce "emi";

  networking.hostName = "celeste";

  home-manager.users.${params.username}.home = {
    packages = with pkgs; [
      prismlauncher
      clang-tools
      cmake
      mpv
      syncplay
      transmission_4-gtk
      #kicad

      firefox # remove later

      fortune

      linux-wifi-hotspot
    ];
  };

  programs.alvr = {
    enable = true;
    openFirewall =  true;
  };
  
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
