{
  stdenv, rustPlatform, fetchFromGitHub, lib, ...
}:
rustPlatform.buildRustPackage (finalAttrs: {
  pname = "vanity-ssh-gpu";
  version = "v0.1.0";
  src = fetchgit {
    url = "https://git.catgirl.cloud/999eagle/vanity-ssh-gpu.git";
    rev = "3a513364ad4341f4fb19e9ea72b7c3819d0ff38e";
    hash = "";
  };
  patches = [ ./changes.patch ];

  cargoHash = "";
  extraRustcOpts = "-C target-cpu=native -O";

  meta = {
    description = "vanity-ssh-gpu nix pkg";
    homepage = "https://git.catgirl.cloud/999eagle/vanity-ssh-gpu/-/tree/main";
    license = lib.licenses.eupl12;
    maintainers = [ "hf-ikea" ];
  };
})