{ lib, stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "breezex-rosepine-cursor";
  version = "20250112";

  src = fetchFromGithub {
    owner = "rose-pine";
    repo = "cursor";
    rev = "v1.1.0";
    hash = "";
  }

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/icons
    mv $out/BreezeX-RosePine-Linux $out/share/icons
    runHook postInstall
  '';

  meta = with lib; {
    description = "A nix package for the Rose Pine Cursor";
    homepage = "https://github.com/rose-pine/cursor";
    license = licenses.gpl3Only;
    platforms = platforms.linux;
  };
