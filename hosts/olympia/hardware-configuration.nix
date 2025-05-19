{ config
, lib
, pkgs
, modulesPath
, ...
}:
let
  rootDevice = "/dev/vda";
  efiPart = "/dev/disk/by-uuid/XXXX-XXXX";
in
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  fileSystems = {
    "/" = {
      device = rootDevice;
      fsType = "btrfs";
      neededForBoot = true;
      options = [ "compress=zstd" "noatime" "subvol=rootfs" "mode=755" ]; # mode=755 so only root can write to those files
    };
    "/persist" = {
      device = rootDevice;
      fsType = "btrfs";
      neededForBoot = true;
      options = [ "compress=zstd" "noatime" "subvol=persist" ];
    };
    "/nix" = {
      device = rootDevice;
      fsType = "btrfs";
      neededForBoot = true;
      options = [ "compress=zstd" "noatime" "subvol=nix" ];
    };
    "/boot" = {
      device = efiPart;
      fsType = "vfat";
    };
  };
}
