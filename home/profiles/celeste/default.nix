{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ../../programs

    #../../programs/wayland
    #../../services/wayland/hyprpaper.nix

    ../../programs/plasma

    ../../terminal/emulators/alacritty.nix

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
