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
  environment.systemPackages = with pkgs; [
    lutris
    (lutris.override {
      extraLibraries = pkgs: [
        # List library dependencies here
      ];
    })
    bottles
    (bottles.override {
      removeWarningPopup = true;
    })
  ];
}
