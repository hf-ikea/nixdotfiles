{ pkgs
, inputs
, ...
}: {
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };
  programs.gamescope.enable = true;
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
