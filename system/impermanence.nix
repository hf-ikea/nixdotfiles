{ flake, pkgs, lib, ... }:
let
  inherit (flake.config) params;
in
{
  security.sudo.extraConfig = "Defaults lecture=never";
  users.mutableUsers = false;
  users.users.${params.username} = {
    # sudo mkpasswd -m sha-512 "hunter2" > /mnt/persist/passwords/user
    passwordFile = "/persist/passwords/user";
  };

  environment.persistence."/persist" = {
    enable = true;
    directories = [
      "/home/${params.username}"
      "/var/log"
      "/var/lib"
      "/etc/NetworkManager/system-connections"
    ];
  };

  boot.initrd = {
    enable = true;
    supportedFilesystems = [ "btrfs" ];
    postResumeCommands = lib.mkAfter ''
      mkdir /btrfs_tmp
      mount /dev/root_vg/root /btrfs_tmp
      if [[ -e /btrfs_tmp/root ]]; then
          mkdir -p /btrfs_tmp/old_roots
          timestamp=$(date --date="@$(stat -c %Y /btrfs_tmp/root)" "+%Y-%m-%-d_%H:%M:%S")
          mv /btrfs_tmp/root "/btrfs_tmp/old_roots/$timestamp"
      fi

      delete_subvolume_recursively() {
          IFS=$'\n'
          for i in $(btrfs subvolume list -o "$1" | cut -f 9- -d ' '); do
              delete_subvolume_recursively "/btrfs_tmp/$i"
          done
          btrfs subvolume delete "$1"
      }

      for i in $(find /btrfs_tmp/old_roots/ -maxdepth 1 -mtime +30); do
          delete_subvolume_recursively "$i"
      done

      btrfs subvolume create /btrfs_tmp/root
      umount /btrfs_tmp
    '';
  };
}
