{ inputs
, pkgs
, ...
}: {
  imports = [
    ../../programs
    ../../programs/spicetify.nix
    ../../programs/plasma
  ];

  # home.packages = with pkgs; [
  #   vesktop
  #   prismlauncher
  #   ark
  #   clang-tools
  #   cmake
  #   xwaylandvideobridge
  #   mpv
  #   syncplay
  #   transmission_4-gtk
  #   kicad
  # ];
}
