{ config
, flake
, pkgs
, ...
}:
{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    # theme = "catppuccin-mocha";
  };

  # environment.systemPackages = [
  #   (
  #     pkgs.catppuccin-sddm.override {
  #       flavor = "mocha";
  #       font = "Noto Sans";
  #       fontSize = "10";
  #       loginBackground = true;
  #       background = params.wallpaper;
  #     }
  #   )
  # ];
}
