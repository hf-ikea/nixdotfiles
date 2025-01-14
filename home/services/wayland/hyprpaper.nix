{
  lib,
  pkgs,
  inputs,
  config,
  ...
}: let
  wallpaper = "~/nixos/emipaper.png";
in {
  services.hyprpaper = {
    enable = true;
    package = inputs.hyprpaper.packages.${pkgs.system}.default;
    settings = {
      ipc = false;
      splash = false;
      preload = [
        (builtins.toString wallpaper)
      ];

      wallpaper = [
        ",${builtins.toString wallpaper}"
      ];
    };
  };
}
