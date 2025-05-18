{
  config,
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
        inputs.home-manager.nixosModules.default
        ./celeste
        ./config.nix
        "${mod}/core"
        "${mod}/programs/zsh.nix"
        "${mod}/hardware/nvidia_desktop.nix"

        "${mod}/programs/sddm.nix"
        #"${mod}/programs/hyprland.nix"
        "${mod}/programs/plasma.nix"
        "${mod}/programs/game.nix"

        # "${self}/home/profiles/celeste"
        # "${self}/home/terminal"
        # "${self}/home"
        {
          home-manager = {
            #users.emi.imports = [./config.nix];
            users.emi.imports = homeImports."emi@celeste" ++ [./config.nix]; # just get rid of this
            extraSpecialArgs = specialArgs;
            backupFileExtension = "backup";
            useGlobalPkgs = true;
            useUserPackages = true;
          };
        }
      ];
    };
  };
}
