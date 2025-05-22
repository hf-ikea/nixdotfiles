{ flake, pkgs, ... }:
let
  inherit (flake.config) params;
  secretspath = builtins.toString flake.inputs.nix-secrets;
in
{
  imports = [
    flake.inputs.sops-nix.nixosModules.sops
  ];

  sops = {
    defaultSopsFile = "${secretspath}/secrets.yaml";
    age = {
      keyFile = "/persist/sops/age/keys.txt";
    };
    secrets = {
      "${params.username}_passwd" = {
        neededForUsers = true;
      };
    };
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
