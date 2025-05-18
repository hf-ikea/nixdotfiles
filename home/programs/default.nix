{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./gtk.nix
    ./firefox.nix
    ./neovim.nix
    ./vscode.nix
  ];
}
