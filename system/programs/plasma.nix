{
  inputs,
  pkgs,
  ...
}: {
  services.xserver.enable = true;
  services.desktopManager.plasma6.enable = true;

  systemd.user.services.set-plasma-wallpaper = {
    description = "Set KDE Plasma wallpaper";
    serviceConfig.ExecStart = ["/run/current-system/sw/bin/plasma-apply-wallpaperimage /home/emi/nixos/celeste.png"];
    wantedBy = ["graphical.target"];
  };
}
