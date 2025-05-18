{
  lib,
  pkgs,
  inputs,
  config,
  ...
}: {
  services.hyprpaper = {
    enable = true;
    package = inputs.hyprpaper.packages.${pkgs.system}.default;
    settings = {
      ipc = false;
      splash = false;
      preload = [
        (builtins.toString config.emi_wallpaper)
      ];

      wallpaper = [
        ",${builtins.toString config.emi_wallpaper}"
      ];
    };
  };
}
