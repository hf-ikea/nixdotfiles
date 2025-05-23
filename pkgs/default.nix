{
  systems = [ "x86_64-linux" ];
  perSystem =
    { inputs
    , pkgs
    , ...
    }: {
      packages = {
        bibata-hyprcursor = pkgs.callPackage ./bibata-hyprcursor { };
        vanityssh-rust = pkgs.callPackage ./vanityssh-rust { };
      };
    };
}
