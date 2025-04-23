{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.plasma-manager.homeManagerModules.plasma-manager
  ];

  programs.plasma = {
    enable = true;
    workspace = {
      iconTheme = "Papirus";
      colorScheme = "CatppuccinFrappeMauve";
      wallpaper = "/home/users/emi/nixos/celeste.png";
      windowDecorations = {
        library = "org.kde.kwin.aurorae";
        theme = "kwin4_decoration_qml_plastik";
      };
    };
    powerdevil = {
      AC.displayBrightness = 10;
    };
  };

  services.kdeconnect = {
    enable = true;
  };

  home.packages = with pkgs; [
    plasma-browser-integration
    papirus-icon-theme
  ];
}
