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
        "${mod}/programs/zsh.nix"
        "${mod}/hardware/nvidia_desktop.nix"

        "${mod}/programs/sddm.nix"
        #"${mod}/programs/hyprland.nix"
        "${mod}/programs/plasma.nix"
        "${mod}/programs/game.nix"
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
