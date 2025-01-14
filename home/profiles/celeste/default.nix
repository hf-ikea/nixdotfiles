{
  inputs,
  pkgs,
  ...
}: {
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
    pkgs.clang-tools
    pkgs.cmake
    pkgs.xwaylandvideobridge
    #inputs.self.packages.${pkgs.system}.xwaylandvideobridge-fix
  ];
}
