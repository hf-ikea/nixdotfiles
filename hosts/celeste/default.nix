{ flake
, pkgs
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
  networking.hostName = "celeste";

  home-manager.users.${params.username}.home = {
    packages = with pkgs; [
      prismlauncher
      mpv
      syncplay
      #transmission_4-gtk
      #kicad
      #linux-wifi-hotspot

      firefox # remove later
    ];
  };

  services.smartd = {
    enable = true;
    devices = [
      {
        device = "/dev/disk/by-id/ata-Samsung_SSD_870_EVO_500GB_S6PXNZ0T705726P";
      }
    ];
  };

  programs.alvr = {
    enable = false;
    openFirewall = true;
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
