{
  lib,
  pkgs,
  config,
  ...
}: {
  #home.file."$HOME/.gtkrc-2.0".force = lib.mkForce true;
  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  gtk = {
    enable = true;
    font.name = "Noto Sans, 10";
    iconTheme.name = "breeze";
  };
}
