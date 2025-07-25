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
    ./containers
    ../../config-module.nix
  ];
  networking.hostName = "everest";

  environment.systemPackages = with pkgs; [
    arion
    docker-client
  ];

  virtualisation = {
    podman = {
      enable = true;
      autoPrune.enable = true;
      dockerCompat = true;
      dockerSocket = true;
      defaultNetwork.settings.dns_enabled = true;
    };
    containers.storage.settings = {
      storage = {
        driver = "btrfs";
        graphroot = "/persist/var/lib/containers/storage";
        runroot = "/persist/container/run";
      };
    };
  };

  # Enable container name DNS for non-default Podman networks.
  # https://github.com/NixOS/nixpkgs/issues/226365
  networking.firewall.interfaces."podman+".allowedUDPPorts = [ 53 ];

  virtualisation.oci-containers.backend = "podman";

  users = {
    extraUsers.${params.username}.extraGroups = [ "podman" ];
    users.${params.username}.openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII3k8bb18Qmo+6wkpMeGZ0ssJDcZd8zECyGVSUhEiP17 celeste"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ0+j48JBbnLDLupxHWeYaNPHrIkP97cNW6c6kG/iris olympia"
    ];
  };

  services = {
    openssh = {
      enable = true;
      Ports = [ 5672 ];
      settings = {
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
        PermitRootLogin = false;
        AllowUsers = [ params.username ];
        LogLevel = "VERBOSE";
      };
    };
    fail2ban.enable = true;
    endlessh = {
      enable = true;
      port = 22;
      openFirewall = true;
    };
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
}
