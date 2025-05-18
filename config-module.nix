{ config
, pkgs
, lib
, ...
}:
with lib; {
  options = {
    params = mkOption {
      default = { };
      type = types.submodule {
        options = {
          username = mkOption {
            type = types.str;
            default = "emi";
          };
          hostname = mkOption {
            type = types.str;
            default = "celeste";
          };
          wallpaper = mkOption {
            type = types.str;
            default = "/home/emi/nixos/wallpaper.png";
          };
          # desktop = mkOption {
          #   type = types.str;
          #   default = "kde";
          # };
        };
      };
    };
  };
  # https://github.com/chewblacka/nixos/blob/main/desktop.nix
  # config = mkMerge [
  #   (mkIf (config.desktop == "kde") {
  #     #
  #   })
  # ]
}
