{
  lib,
  pkgs,
  ...
}:

{
  breezex-rosepine-cursor = pkgs.callPackage ./breezex-rosepine-cursor.nix { };
}
