{ pkgs, ... }: {
  imports = [
    ./git.nix
    ./fetch.nix
    ./fish.nix
  ];

  programs.btop = {
    enable = true;
  };
  programs.htop = {
    enable = true;
  };
}
