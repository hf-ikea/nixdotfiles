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
        #"${mod}/programs/uwsm.nix"
        "${mod}/programs/hyprland.nix"
        "${mod}/programs/zsh.nix"
        "${mod}/programs/thunar.nix"
        "${mod}/services"
        "${mod}/services/pipewire.nix"
        "${mod}/hardware/nvidia.nix"
        {
          home-manager = {
            users.emi.imports = homeImports."emi@celeste";
            extraSpecialArgs = specialArgs;
          };
        }
      ];
    };
  };
}
