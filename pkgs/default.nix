{
  systems = [ "x86_64-linux" ];
  perSystem =
    { inputs
    , pkgs
    , ...
    }: {
      packages = {
        bibata-hyprcursor = pkgs.callPackage ./bibata-hyprcursor { };
        ssh-keygen-ed25519-vanity = pkgs.callPackage ./ssh-keygen-ed25519-vanity { };
      };
    };
}
