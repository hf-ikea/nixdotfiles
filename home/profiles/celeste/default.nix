{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ../../programs
    ../../programs/spicetify.nix

    ./kde.nix
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
