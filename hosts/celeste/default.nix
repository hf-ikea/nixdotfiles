{
  self,
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

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

  nix.settings.experimental-features = ["nix-command" "flakes"];

  networking.hostName = "celeste"; # Define your hostname.
  # Enable networking
  networking.networkmanager.enable = true;

  system.userActivationScripts = {
    removeConflictingFiles = {
      text = ''
        rm -f /home/emi/.gtkrc-2.0.backup
      '';
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    ntfs3g
  ];

  fonts.packages = with pkgs; [
    font-awesome
    jetbrains-mono
    liberation_ttf
  ];
}
