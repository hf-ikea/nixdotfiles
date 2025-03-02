{
  inputs,
  pkgs,
  ...
}: {
  services.xserver.enable = true;
  services.desktopManager.plasma6.enable = true;

  systemd.user.services.set-wallpaper = {
    description = "Set KDE Plasma wallpaper";
    serviceConfig.ExecStart = ["/run/current-system/sw/bin/plasma-apply-wallpaperimage /home/emi/nixos/emipaper.jpg"];
    wantedBy = ["graphical.target"];
  };
}
