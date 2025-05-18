{
  config,
  pkgs,
  lib,
  ...
}:
with lib; {
  options = {
    wallpaper = mkOption {
      type = types.str;
      default = "/home/emi/nixos/wallpaper.png";
    };
    desktop = mkOption {
      type = types.str;
      default = "kde";
    };
  };
  config = {
    wallpaper = "/home/emi/nixos/wallpaper.png";
  };
  # https://github.com/chewblacka/nixos/blob/main/desktop.nix
  # config = mkMerge [
  #   (mkIf (config.desktop == "kde") {
  #     #
  #   })
  # ]
}
