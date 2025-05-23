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
          homemod = "${self}/home";
          homeImports = import "${self}/home/profiles";
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

              "${mod}/programs/sddm.nix"
              #"${mod}/programs/hyprland.nix"
              "${mod}/programs/plasma.nix"
              "${mod}/programs/game.nix"
              # {
              #   config.params.hostname = "celeste";
              #   config.params.username = "emi";
              # }
              {
                home-manager.users.emi = { pkgs, ... }: {
                  imports =
                    [
                      self.homeModules.default
                      "${homemod}/programs/spicetify.nix"
                      "${homemod}/programs/plasma"
                      #"${homemod}/programs/nixcord.nix"
                    ];
                  home = {
                    homeDirectory = inputs.nixpkgs.lib.mkForce "/home/emi";
                    stateVersion = "24.11"; # leave alone
                    packages = with pkgs; [
                      vesktop
                      prismlauncher
                      kdePackages.ark
                      clang-tools
                      cmake
                      kdePackages.xwaylandvideobridge
                      mpv
                      syncplay
                      transmission_4-gtk
                      kicad
                    ];
                  };
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
              "${mod}/programs/sddm.nix"
              "${mod}/programs/plasma.nix"
              {
                home-manager.users.iris = { pkgs, ... }: {
                  imports = [
                    self.homeModules.default
                    inputs.sops-nix.homeManagerModules.sops
                    "${homemod}/programs/plasma"
                  ];
                  home = {
                    stateVersion = "24.11";
                    packages = with pkgs; [
                      vesktop
                    ];
                  };
                };
              }
            ];
          };
          homeModules.default =
            { config
            , pkgs
            , ...
            }: {
              imports = [
                "${homemod}/programs"
                "${homemod}/terminal/programs"
              ];
            };
        };
    };
}
