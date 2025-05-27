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
    dataFile."dolphin/view_properties/global/.directory".Settings.HiddenFilesShown = true;
    configFile."mimeapps.list" = {
      "Default Applications" = {
        "x-scheme-handler/discord" = "vesktop.desktop";
        "x-scheme-handler/http" = "librewolf.desktop";
        "x-scheme-handler/https" = "librewolf.desktop";
      };
    };
  };

  programs.konsole = {
    enable = false;
    defaultProfile = "default";
    profiles.default = {
      font = {
        name = "JetBrains Mono";
        size = 11;
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
    kdePackages.ark
    kdePackages.xwaylandvideobridge
  ];
}
