{
  inputs,
  pkgs,
  config,
  ...
}: let
  wallpaper = "../users/emipaper.png";
in {
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "off";
      preload = [
        (builtins.toString wallpaper)
      ];

      wallpaper = [
        ",${builtins.toString wallpaper}"
      ];
    };
  };
}
