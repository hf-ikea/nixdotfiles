{ pkgs
, lib
, flake
, ...
}:
let
  inherit (flake.config) params;
in
{
  users.users.${params.username} = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "emi";
    extraGroups = [ "networkmanager" "wheel" "emi" ];
    packages = with pkgs; [
      devenv
    ];
  };
}
