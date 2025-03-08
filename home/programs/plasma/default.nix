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
      colorScheme = "CatppuccinFrappeMauve";
      lookAndFeel = "Catppuccin-Frappe-Mauve";
      wallpaper = "/home/users/emi/nixos/celeste.png";
      windowDecorations = {
        library = "org.kde.kwin.aurorae";
        theme = "kwin4_decoration_qml_plastik";
      };
    };
  };

  home.packages = with pkgs; [
    plasma-browser-integration
  ];
}
