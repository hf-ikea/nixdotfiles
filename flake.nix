{
  description = "awesome nixos flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-unified.url = "github:srid/nixos-unified";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    hyprpaper = {
      url = "github:hyprwm/hyprpaper";
      inputs = {
        hyprlang.follows = "hyprland/hyprlang";
        hyprutils.follows = "hyprland/hyprutils";
        nixpkgs.follows = "hyprland/nixpkgs";
        systems.follows = "hyprland/systems";
      };
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, ... }:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.nixos-unified.flakeModules.default
        #inputs.nixos-unified.flakeModules.autoWire
        ./pkgs
        ./config-module.nix
      ];

      systems = [ "x86_64-linux" ];
      perSystem =
        { config
        , pkgs
        , ...
        }: {
          formatter = pkgs.nixpkgs-fmt;
        };

      flake =
        let
          inherit (inputs.nixpkgs.lib) nixosSystem;
          mod = "${self}/system";
          homeImports = import "${self}/home/profiles";
        in
        {
          nixosConfigurations."celeste" = self.nixos-unified.lib.mkLinuxSystem { home-manager = true; } {
            nixpkgs.hostPlatform = "x86_64-linux";
            imports = [
              ./hosts/celeste
              "${mod}/core"
              "${mod}/hardware/nvidia_desktop.nix"

              "${mod}/programs/sddm.nix"
              #"${mod}/programs/hyprland.nix"
              "${mod}/programs/plasma.nix"
              "${mod}/programs/game.nix"
              {
                home-manager.users.emi = {
                  imports =
                    [
                      self.homeModules.default
                    ]
                    ++ homeImports."emi@celeste";
                };
              }
            ];
          };
          homeModules.default =
            { config
            , pkgs
            , ...
            }: {
              imports = [ ];
            };
        };
    };
}
