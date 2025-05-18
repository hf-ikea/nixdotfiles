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

  params.hostname = "celeste";


  networking.hostName = params.hostname;
  # Enable networking
  networking.networkmanager.enable = true;

  users.users.${params.username} = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = params.username;
    extraGroups = [ "networkmanager" "wheel" params.username ];
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
      trusted-users = [ "root" params.username ];
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  boot.blacklistedKernelModules = [
    "dvb_usb_rtl28xxu"
  ];

  system.userActivationScripts = {
    removeConflictingFiles = {
      text = ''
        rm -f /home/${params.username}/.gtkrc-2.0.backup
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
