{ inputs
, pkgs
, ...
}: {
  imports = [
    ../../terminal
    ../../programs
    ../../programs/spicetify.nix
    ../../programs/plasma
  ];
}
