{ pkgs
, flake
, ...
}: {
  # enable hyprland and required options
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    package = flake.inputs.hyprland.packages.${pkgs.system}.default;
    portalPackage = flake.inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
  };

  programs.uwsm.waylandCompositors = {
    hyprland = {
      prettyName = "Hyprland";
      comment = "Hyprland compositor managed by UWSM";
      binPath = "/run/current-system/sw/bin/Hyprland";
    };
  };

  # hyprland wiki, fix mesa package to be matched with hyprland
  hardware.graphics = {
    package = flake.inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.system}.mesa.drivers;

    # if you also want 32-bit support (e.g for Steam)
    enable32Bit = true;
    package32 = flake.inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.system}.pkgsi686Linux.mesa.drivers;
  };

  # hint Electron/Chromium to run on Wayland
  environment.variables.NIXOS_OZONE_WL = "1";

  #enable thunar file manager
  programs.thunar = {
    enable = true;
  };
}
