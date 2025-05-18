{ flake
, pkgs
, ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ../../config-module.nix
  ];
  params.hostname = "celeste";

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

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  boot.blacklistedKernelModules = [
    "dvb_usb_rtl28xxu"
  ];

  environment.systemPackages = with pkgs; [
    ntfs3g
  ];

  fonts.packages = with pkgs; [
    font-awesome
    jetbrains-mono
    liberation_ttf
  ];
}
