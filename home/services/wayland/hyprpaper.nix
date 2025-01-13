{
  lib,
  pkgs,
  inputs,
  config,
  ...
}: let
  wallpaper = pkgs.fetchurl {
    url = "https://i.redd.it/mvev8aelh7zc1.png";
    hash = "sha256-lJjIq+3140a5OkNy/FAEOCoCcvQqOi73GWJGwR2zT9w";
  };
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
