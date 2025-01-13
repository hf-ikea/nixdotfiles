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
      preload = [(builtins.toString wallpaper)];
      wallpapers = [",${builtins.toString wallpaper}"];
    };
  };

  systemd.user.services.hyprpaper.Unit.After = lib.mkForce "graphical-session.target";
}
