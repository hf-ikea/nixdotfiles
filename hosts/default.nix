{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations = let
    inherit (inputs.nixpkgs.lib) nixosSystem;
    homeImports = import "${self}/home/profiles";
    mod = "${self}/system";
    inherit (import mod) celeste;
    specialArgs = {inherit inputs self;};
  in {
    default = nixosSystem {
      inherit specialArgs;
      modules =
        celeste
        ++ [
          ./celeste
          "${mod}/programs/hyprland.nix"
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
