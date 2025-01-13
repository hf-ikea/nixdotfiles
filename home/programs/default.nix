{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./gtk.nix
    ./firefox.nix
  ];
}
