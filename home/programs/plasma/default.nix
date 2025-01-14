{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.plasma-manager.homeManagerModules.plasma-manager
  ];

  programs.plasma = {
    enable = true;
  };

  home.packages = with pkgs; [
    plasma-browser-integration
  ];
}
