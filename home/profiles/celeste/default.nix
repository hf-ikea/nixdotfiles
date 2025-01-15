{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ../../programs

    #../../programs/wayland
    #../../services/wayland/hyprpaper.nix
    #../../terminal/emulators/alacritty.nix

    ../../programs/plasma

    ../../editors/neovim
    ../../editors/vscode
  ];

  home.packages = with pkgs; [
    vesktop
    prismlauncher
    ark
    clang-tools
    cmake
    xwaylandvideobridge
  ];
}
