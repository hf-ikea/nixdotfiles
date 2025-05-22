{
  stdenv, fetchFromGitHub, ...
}:
pkgs.rustPlatform.buildRustPackage (finalAttrs: {
  pname = "ssh-keygen-ed25519-vanity";
  version = "v0.0.1";
  src = fetchFromGitHub {
    owner = "hf-ikea";
    repo = "ssh-keygen-ed25519-vanity";
    tag = finalAttrs.version;
    hash = "";
  };

  cargoLock = {
    lockFile = ./Cargo.lock;
    allowBuiltinFetchGit = true;
  };

  meta = {
    description = "ssh-keygen-ed25519-vanity nix derivation";
    homepage = "https://github.com/hf-ikea/ssh-keygen-ed25519-vanity";
    license = lib.licenses.unlicense;
    maintainers = [ "hf-ikea" ];
  };
})