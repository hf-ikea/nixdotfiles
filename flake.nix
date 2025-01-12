{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = {
    nixpkgs,
    home-manager,
    hyprland,
    ...
  } @ inputs: let
    lib = nixpkgs.lib.extend (_: _: import ./lib {lib = nixpkgs.lib;});
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    packages = import ./pkgs {inherit lib pkgs;};
    formatter."x86_64-linux" = pkgs.alejandra;
    overlays = import ./overlays {inherit lib inputs;};

    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/default/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.emi = import ./users/emi.nix;
        }
        {
          programs.hyprland = {
            enable = true;
            xwayland.enable = true;
            package = hyprland.packages."${pkgs.system}".hyprland;
          };
        }
      ];
    };
  };
}
