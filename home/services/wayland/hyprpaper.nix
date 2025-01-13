{
  lib,
  pkgs,
  inputs,
  config,
  ...
}: let
  wallpaper_path = "~/nixos/emipaper.png";
in {
  services.hyprpaper = {
    enable = true;
    package = inputs.hyprpaper.packages.${pkgs.system}.default;
    settings = {
      preload = wallpaper_path;
      wallpaper = wallpaper_path;
    };
  };

  systemd.user.services.hyprpaper.Unit.After = lib.mkForce "graphical-session.target";
}
