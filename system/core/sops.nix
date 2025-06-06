{ flake, pkgs, config, ... }:
let
  inherit (flake.config) params;
  secretspath = builtins.toString flake.inputs.nix-secrets;
  agekeyfile = "/persist/sops/age/key.txt"; # required!  !! !
in
{
  imports = [
    flake.inputs.sops-nix.nixosModules.sops
  ];

  sops = {
    defaultSopsFile = "${secretspath}/secrets.json";
    age.keyFile = agekeyfile;
    secrets = {
      "${params.username}_passwd" = {
        neededForUsers = true;
      };
    };
  };

  home-manager.users.${params.username} = {
    sops = {
      age.keyFile = agekeyfile;
      defaultSopsFile = "${secretspath}/secrets.json";
      secrets = {
        age_identity = {
          path = "/home/${params.username}/.config/sops/age/keys.txt";
        };
        ssh_private = {
          path = "/home/${params.username}/.ssh/id_ed25519";
        };
        ssh_public = {
          path = "/home/${params.username}/.ssh/id_ed25519.pub";
        };
        wakatime_cfg = {
          path = "/home/${params.username}/.wakatime.cfg";
        };
      };
    };
  };

  users.users.${params.username} = {
    hashedPasswordFile = config.sops.secrets."${params.username}_passwd".path;
  };

  services.pcscd.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  environment.systemPackages = with pkgs; [
    pinentry-gtk2
    age
    sops
  ];
}
