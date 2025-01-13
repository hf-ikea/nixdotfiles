let
  celeste = [
    ./core
    ./services
    ./services/pipewire.nix
  ];
in {
  inherit celeste;
}
