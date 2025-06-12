{ lib
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
            default = "iris";
          };
          hostname = mkOption {
            type = types.str;
            default = "olympia";
          };
          wallpaper = mkOption {
            type = types.str;
            default = "/etc/nixos/wallpaper.png";
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
