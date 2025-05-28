{ config
, flake
, pkgs
, ...
}:
{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
}
