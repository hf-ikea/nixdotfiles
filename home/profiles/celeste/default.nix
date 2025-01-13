{pkgs, ...}: {
  imports = [
    ../../programs
    ../../programs/wayland

    ../../services/wayland/hyprpaper.nix

    ../../terminal/emulators/alacritty.nix

    ../../editors/neovim
    ../../editors/vscode
  ];

  home.packages = [
    pkgs.vesktop
    pkgs.prismlauncher
    pkgs.ark
  ];
}
