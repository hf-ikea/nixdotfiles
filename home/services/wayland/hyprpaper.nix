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
      preload = [(builtins.toString wallpaper_path)];
      wallpapers = [",${builtins.toString wallpaper_path}"];
    };
  };

  systemd.user.services.hyprpaper.Unit.After = lib.mkForce "graphical-session.target";
}
