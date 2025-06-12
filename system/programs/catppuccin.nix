{ flake, ... }:
let
  inherit (flake.config) params;
in
{
  imports = [
    flake.inputs.catppuccin.nixosModules.catppuccin
  ];
  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "mauve";
    sddm = {
      flavor = "mocha";
      font = "Noto Sans";
      fontSize = "10";
      loginBackground = true;
      background = params.wallpaper;
    };
  };
}
