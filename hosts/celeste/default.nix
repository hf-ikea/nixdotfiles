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

  programs.alvr = {
    enable = false;
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
