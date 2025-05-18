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
  ];

  users.users.${params.username} = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "emi";
    extraGroups = [ "networkmanager" "wheel" "emi" ];
    packages = with pkgs; [
      devenv
    ];
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

  nix = {
    settings = {
      trusted-users = [ "root" "emi" ];
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  boot.blacklistedKernelModules = [
    "dvb_usb_rtl28xxu"
  ];

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

  environment.systemPackages = with pkgs; [
    ntfs3g
  ];

  fonts.packages = with pkgs; [
    font-awesome
    jetbrains-mono
    liberation_ttf
  ];
}
