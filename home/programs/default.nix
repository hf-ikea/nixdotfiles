{ pkgs
, inputs
, ...
}: {
  imports = [
    ./gtk.nix
    ./librewolf.nix
    ./neovim.nix
    ./vscode.nix
    ./catppuccin.nix
  ];
}
