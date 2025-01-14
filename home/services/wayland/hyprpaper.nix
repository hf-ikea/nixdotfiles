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
      splash = true;
      preload = [
        (builtins.toString wallpaper)
      ];

      wallpaper = [
        ",${builtins.toString wallpaper}"
      ];
    };
  };

  systemd.user.services.hyprpaper.Unit.After = lib.mkForce "graphical.target";
}
