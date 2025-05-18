{ lib
, self
, flake
, ...
}:
let
  inherit (flake.config) params;
in
{
  home = {
    username = params.username;
    homeDirectory = lib.mkForce "/home/${params.username}";
    stateVersion = "24.11"; # do not change EVER
    #extraOutputsToInstall = [];
  };

  #programs.home-manager.enable = true;
}
