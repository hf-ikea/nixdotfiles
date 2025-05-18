{ pkgs, ... }: {
  imports = [
    ./git.nix
    ./fetch.nix
    ./zsh.nix
  ];

  programs.btop = {
    enable = true;
  };
  programs.htop = {
    enable = true;
  };
}
