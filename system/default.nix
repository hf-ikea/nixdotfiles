let
  celeste = [
    ./core
    ./programs
    ./services
    ./services/pipewire.nix
  ];
in {
  inherit celeste;
}
