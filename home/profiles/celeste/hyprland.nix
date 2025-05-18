{pkgs, ...}: {
  imports = [
    ../../programs/wayland
    ../../programs/wayland/hyprland
    ../../terminal/emulators/alacritty.nix
  ];
}
