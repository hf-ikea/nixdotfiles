{ flake, lib, config, ... }:
let
  inherit (flake.config) params;
in
{
  security.sudo.extraConfig = "Defaults lecture=never";
  users.mutableUsers = false;

  environment.persistence."/persist" = {
    enable = true;
    directories = [
      "/etc/NetworkManager/system-connections"
      "/var/lib"
      { directory = "/etc/nixos"; user = params.username; group = params.username; }
    ];
    users.${params.username} = {
      directories = [
        "Documents"
        lib.mkIf (config.networking.hostName != "everest") ".steam"
      ];
      files = [
        { file = ".zsh_history"; parentDirectory = { user = params.username; group = params.username; }; }
        lib.mkIf (config.networking.hostName != "everest") { file = ".config/dolphinrc"; parentDirectory = { user = params.username; group = params.username; }; }
      ];
    };
  };

  services.openssh = {
    knownHosts = {
      "github.com".publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl";
      "everest".publicKey = "ssh-ed25518 AAAAC3NzaC1lZDI1NTE5AAAAINbIspmlunZlvfzGui/OoTxIz8vCaYJRMwKYcgK6zVMi";
    };
  };

  boot.initrd = {
    enable = true;
    supportedFilesystems = [ "btrfs" ];

    postResumeCommands = lib.mkAfter ''
      mkdir -p /mnt
      # We first mount the btrfs root to /mnt
      # so we can manipulate btrfs subvolumes.
      mount -o subvol=/ /dev/nvme0n1p2 /mnt
  
      # While we're tempted to just delete /root and create
      # a new snapshot from /root-blank, /root is already
      # populated at this point with a number of subvolumes,
      # which makes `btrfs subvolume delete` fail.
      # So, we remove them first.
      #
      # /root contains subvolumes:
      # - /root/var/lib/portables
      # - /root/var/lib/machines
      #
      # I suspect these are related to systemd-nspawn, but
      # since I don't use it I'm not 100% sure.
      # Anyhow, deleting these subvolumes hasn't resulted
      # in any issues so far, except for fairly
      # benign-looking errors from systemd-tmpfiles.
      btrfs subvolume list -o /mnt/root |
      cut -f9 -d' ' |
      while read subvolume; do
        echo "deleting /$subvolume subvolume..."
        btrfs subvolume delete "/mnt/$subvolume"
      done &&
      echo "deleting /root subvolume..." &&
      btrfs subvolume delete /mnt/root

      echo "restoring blank /root subvolume..."
      btrfs subvolume snapshot /mnt/root-blank /mnt/root
  
      # Once we're done rolling back to a blank snapshot,
      # we can unmount /mnt and continue on the boot process.
      umount /mnt
    '';
  };
}
