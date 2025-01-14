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
    wl-clipboard
  ];

  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
  };

  xdg.portal = {
    enable = true;
    config = {
      common = {
        default = [
          "wayland"
        ];
      };
    };
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };
}
