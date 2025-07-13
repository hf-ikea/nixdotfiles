{
  description = "awesome nixos flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-unified.url = "github:srid/nixos-unified";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    impermanence.url = "github:nix-community/impermanence";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-secrets = {
      url = "git+ssh://git@github.com/hf-ikea/nixsecrets?shallow=1&ref=main";
      flake = false;
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

    nixcord.url = "github:kaylorben/nixcord";

    catppuccin.url = "github:catppuccin/nix";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    t480-fingerprint-nixos = {
      url = "github:viktor-grunwaldt/t480-fingerprint-nixos";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, ... }:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.nixos-unified.flakeModules.default
        ./pkgs
        ./config-module.nix
      ];

      systems = [ "x86_64-linux" ];
      perSystem =
        { pkgs
        , ...
        }: {
          formatter = pkgs.nixpkgs-fmt;
        };

      flake =
        let
          mod = "${self}/system";
          homemod = "${self}/home";
        in
        {
          nixosConfigurations."celeste" = self.nixos-unified.lib.mkLinuxSystem { home-manager = true; } {
            nixpkgs = {
              hostPlatform = "x86_64-linux";
              config.allowUnfree = true;
            };
            imports = [
              ./hosts/celeste
              "${mod}/core"
              "${mod}/hardware/nvidia_desktop.nix"

              "${mod}/programs/catppuccin.nix"
              "${mod}/programs/sddm.nix"
              "${mod}/programs/plasma.nix"
              "${mod}/programs/game.nix"
              {
                home-manager.users.emi = {
                  imports = [
                    self.homeModules.default
                    "${homemod}/programs/spicetify.nix"
                    "${homemod}/programs/plasma"
                    "${homemod}/programs/nixcord.nix"
                  ];
                };
              }
            ];
          };
          nixosConfigurations."olympia" = self.nixos-unified.lib.mkLinuxSystem { home-manager = true; } {
            nixpkgs = {
              hostPlatform = "x86_64-linux";
              config.allowUnfree = true;
            };
            imports = [
              inputs.impermanence.nixosModules.impermanence
              inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t480
              ./hosts/olympia
              "${mod}/core"
              "${mod}/core/sops.nix"
              "${mod}/core/impermanence.nix"
              "${mod}/core/virt-manager.nix"

              "${mod}/programs/catppuccin.nix"
              "${mod}/programs/sddm.nix"
              "${mod}/programs/plasma.nix"
              "${mod}/programs/game.nix"
              #inputs.t480-fingerprint-nixos.nixosModules."06cb-009a-fingerprint-sensor"
              {
                home-manager.users.iris = {
                  imports = [
                    self.homeModules.default
                    inputs.sops-nix.homeManagerModules.sops
                    "${homemod}/programs/plasma"
                    "${homemod}/programs/nixcord.nix"
                    "${homemod}/programs/spicetify.nix"
                  ];
                };
              }
            ];
          };
          homeModules.default = {
            imports = [
              "${homemod}/programs"
              "${homemod}/terminal/programs"
              "${homemod}/terminal/emulators/foot.nix"
              inputs.catppuccin.homeModules.catppuccin
            ];
          };
        };
    };
}
