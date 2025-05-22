#!/run/current-system/sw/bin/sh
set -e
pushd ~/nixos/
nix fmt -- **/*.nix
#git diff -U0 '*.nix'
sudo nixos-rebuild switch --flake ~/nixos#celeste --show-trace
current=$(nixos-rebuild list-generations | grep current)
git commit -am "$current"
popd
