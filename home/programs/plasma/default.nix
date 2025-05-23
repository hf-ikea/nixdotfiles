{ flake
, config
, pkgs
, ...
}:
let
  inherit (flake.config) params;
in
{
  imports = [
    flake.inputs.plasma-manager.homeManagerModules.plasma-manager
  ];

  programs.plasma = {
    enable = true;
    workspace = {
      iconTheme = "Papirus";
      colorScheme = "CatppuccinFrappeMauve";
      wallpaper = params.wallpaper;
      windowDecorations = {
        library = "org.kde.kwin.aurorae";
        theme = "kwin4_decoration_qml_plastik";
      };
    };
  };

  programs.konsole = {
    enable = true;
    defaultProfile = "default";
    profiles.default = {
      font = {
        name = "JetBrains Mono";
        size = 12;
      };
    };
  };

  services.kdeconnect = {
    enable = true;
  };

  home.packages = with pkgs; [
    catppuccin-kde
    kdePackages.plasma-browser-integration
    papirus-icon-theme
  ];
}
