{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations = let
    inherit (inputs.nixpkgs.lib) nixosSystem;
    homeImports = import "${self}/home/profiles";
    mod = "${self}/system";
    specialArgs = {inherit inputs self;};
  in {
    default = nixosSystem {
      inherit specialArgs;
      modules = [
        ./celeste
        "${mod}/core"
        "${mod}/programs/zsh.nix"
        "${mod}/services"
        "${mod}/services/pipewire.nix"
        "${mod}/services/ipfs.nix"
        "${mod}/hardware/nvidia.nix"
        "${mod}/game"

        #"${mod}/programs/hyprland.nix"
        #"${mod}/programs/thunar.nix"
        "${mod}/programs/sddm.nix"
        "${mod}/programs/plasma.nix"
        {
          home-manager = {
            users.emi.imports = homeImports."emi@celeste";
            extraSpecialArgs = specialArgs;
            backupFileExtension = "backup";
          };
        }
      ];
    };
  };
}
