#!/usr/bin/env bash
# fs-diff.sh
# https://serverfault.com/questions/399894/does-btrfs-have-an-efficient-way-to-compare-snapshots
# sudo mkdir /mnt ; sudo mount -o subvol=/ /dev/sda3 /mnt ; ./fs-diff.sh
set -euo pipefail

OLD_TRANSID=$(sudo btrfs subvolume find-new /mnt/root-blank 9999999)
OLD_TRANSID=${OLD_TRANSID#transid marker was }

sudo btrfs subvolume find-new "/mnt/root" "$OLD_TRANSID" |
sed '$d' |
cut -f17- -d' ' |
sort |
uniq |
while read path; do
  path="/$path"
  if [ -L "$path" ]; then
    : # The path is a symbolic link, so is probably handled by NixOS already
  elif [ -d "$path" ]; then
    : # The path is a directory, ignore
  else
    echo "$path"
  fi
done