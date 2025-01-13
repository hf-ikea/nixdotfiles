{
  pkgs,
  self,
  ...
}: {
  imports = [
    ./hyprland
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
}
