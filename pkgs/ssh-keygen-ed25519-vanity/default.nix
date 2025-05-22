{
  stdenv, rustPlatform, fetchFromGitHub, lib, ...
}:
rustPlatform.buildRustPackage (finalAttrs: {
  pname = "ssh-keygen-ed25519-vanity";
  version = "v0.0.6";
  src = fetchFromGitHub {
    owner = "hf-ikea";
    repo = "ssh-keygen-ed25519-vanity";
    tag = finalAttrs.version;
    hash = "sha256-lcdCUjg9AePa8QQQDfF2XXicws2f8nfpv/WvHcURwKA=";
  };

  cargoHash = "sha256-nrbyrK+sH16b1pDKVL3Rk2QndKKRDYwmGSbxHYmZreM=";

  meta = {
    description = "ssh-keygen-ed25519-vanity nix derivation";
    homepage = "https://github.com/hf-ikea/ssh-keygen-ed25519-vanity";
    license = lib.licenses.unlicense;
    maintainers = [ "hf-ikea" ];
  };
})