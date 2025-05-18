{
  config,
  pkgs,
  lib,
  ...
}: {
  options = {
    emi_wallpaper = lib.mkOption {
      type = lib.types.str;
      default = "/home/emi/nixos/wallpaper.png";
    };
  };
  config = {
    emi_wallpaper = "/home/emi/nixos/wallpaper.png";
  };
}
