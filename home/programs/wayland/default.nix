{ pkgs
, self
, ...
}: {
  home.packages = with pkgs; [
    wl-clipboard
  ];

  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
  };

  programs.zsh.profileExtra = "if uwsm check may-start && uwsm select; then
	    exec systemd-cat -t uwsm_start uwsm start default
    fi";

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
