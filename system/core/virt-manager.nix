{ flake, ... }:
let
  inherit (flake.config) params;
in
{
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = [ params.username ];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  users.users.${params.username}.extraGroups = [ "libvirtd" ];

  home-manager.users.${params.username} = {
    dconf.settings = {
      "org/virt-manager/virt-manager/connections" = {
        autoconnect = [ "qemu:///system" ];
        uris = [ "qemu:///system" ];
      };
    };
  };
}
