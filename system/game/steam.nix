{
  pkgs,
  inputs,
  ...
}: {
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };
  environment.systemPackages = [
    pkgs.lutris
    (pkgs.lutris.override {
      extraLibraries = pkgs: [
        # List library dependencies here
      ];
    })
    pkgs.bottles
    (pkgs.bottles.override {
      removeWarningPopup = true;
    })
  ];
}
