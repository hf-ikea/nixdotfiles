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

    ../../programs/spicetify.nix

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
    mpv
    syncplay
    transmission_4-gtk
    kicad
  ];
}
