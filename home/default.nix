{lib, self, inputs, ...}:
{
  imports = [
    #
  ];
  
  home = {
    username = "emi";
    homeDirectory = "/home/emi";
    stateVersion = "24.11"; # do not change EVER
    extraOutputs = [ ];
  };

  programs.home-manager.enable = true;
};
