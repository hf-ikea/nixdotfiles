{
  systems = ["x86_64-linux"];

  perSystem = {
    inputs,
    pkgs,
    ...
  }: {
    packages = {
      bibata-hyprcursor = pkgs.callPackage ./bibata-hyprcursor {};
      olympus = pkgs.callPackage ./olympus {}; # https://github.com/NixOS/nixpkgs/pull/309327
    };
  };
}
