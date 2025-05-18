{
  config,
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations = let
    username = "emi";
    inherit (inputs.nixpkgs.lib) nixosSystem;
    homeImports = import "${self}/home/profiles";
    mod = "${self}/system";
  in {
    "celeste" = self.nixos-unified.lib.mkLinuxSystem {home-manager = true;} {
      nixpkgs.hostPlatform = "x86_64-linux";
      imports = [
        ./celeste
        ./config.nix
        "${mod}/core"
        "${mod}/programs/zsh.nix"
        "${mod}/hardware/nvidia_desktop.nix"

        "${mod}/programs/sddm.nix"
        #"${mod}/programs/hyprland.nix"
        "${mod}/programs/plasma.nix"
        "${mod}/programs/game.nix"

        {
          home-manager.users.${username} = {
            imports = [self.homeModules.default];
          };
        }
      ];
    };
    homeModules.default = {pkgs, ...}: {
      imports = [
        "${self}/home/profiles"."emi@celeste"
      ];
    };
  };
}
