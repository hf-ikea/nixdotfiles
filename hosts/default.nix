{self, inputs, ...}:
{
  flake.nixosConfigurations = let
    inherit (inputs.nixpkgs.lib) nixosSystem;
    homeImports = import "${self}/home/profiles";
    mod = "${self}/system";
    inherit (import mod) celeste;
    specialArgs = {inherit inputs self;};
  in {
    default = nixosSystem {
      inherit specialArgs;
      modules = celeste ++ [
	      ./celeste
	      {
	        home-manager = {
	          users.emi.imports = homeImports."emi@celeste";
	          extraSpecialArgs = specialArgs;
          };
        }
      ];
	  };
	}
	home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.emi = import ../users/emi.nix;
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
