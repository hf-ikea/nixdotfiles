{
  pkgs,
  self,
  ...
}: {
  imports = [
    ./hyprland
    ./wofi.nix
    ./waybar
  ];

  home.packages = with pkgs; [
    hyprshot
    wl-clipboard
  ];

  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };
}
