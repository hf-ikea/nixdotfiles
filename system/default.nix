let
  celeste = [
    ./programs

    ./services
    ./services/pipewire
  ];
in {
  inherit celeste;
}
