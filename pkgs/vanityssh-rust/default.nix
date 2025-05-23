{
  stdenv, rustPlatform, fetchFromGitHub, lib, ...
}:
rustPlatform.buildRustPackage (finalAttrs: {
  pname = "vanityssh-rust";
  version = "v0.1.0";
  src = fetchFromGitHub {
    owner = "opendream";
    repo = "vanityssh-rust";
    tag = finalAttrs.version;
    hash = "sha256-V4OKLmdazwgPrBSb6/VXG3g4mKU5PIa3X2tfyiSgvfM=";
  };

  cargoHash = "";

  meta = {
    description = "vanityssh-rust nix pkg";
    homepage = "https://github.com/opendream/vanityssh-rust";
    license = lib.licenses.mit;
    maintainers = [ "hf-ikea" ];
  };
})