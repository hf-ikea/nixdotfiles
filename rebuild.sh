set -e

pushd ~/nixos/

nix fmt

git diff -U0 '*.nix'

sudo nixos-rebuild switch --upgrade --flake ~/nixos#default 

current=$(nixos-rebuild list-generations | grep current)

git commit -am "$current"

popd
