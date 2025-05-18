{ lib
, self
, inputs
, ...
}: {
  home = {
    username = "emi";
    homeDirectory = lib.mkForce "/home/emi";
    stateVersion = "24.11"; # do not change EVER
    #extraOutputsToInstall = [];
  };

  programs.home-manager.enable = true;
}
