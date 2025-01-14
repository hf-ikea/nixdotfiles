{
  systems = ["x86_64-linux"];

  perSystem = {
    inputs,
    pkgs,
    ...
  }: {
    packages = {
      bibata-hyprcursor = pkgs.callPackage ./bibata-hyprcursor {};
      #xwaylandvideobridge-fix = pkgs.callPackage ./xwaylandvideobridge-fix {};
    };
  };
}
