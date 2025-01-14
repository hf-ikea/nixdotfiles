{
  inputs,
  pkgs,
  ...
}: {
  services.xserver.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
}
