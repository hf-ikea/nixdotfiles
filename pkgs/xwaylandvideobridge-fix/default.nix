{
  lib,
  pkgs,
  stdenv,
  fetchgit,
  cmake,
  extra-cmake-modules,
  pkg-config,
  #qtbase,
  #qtdeclarative,
  #qtx11extras ? null, # qt5 only
  #kcoreaddons,
  #ki18n,
  #knotifications,
  #kpipewire,
  #kstatusnotifieritem ? null, # qt6 only
  #kwindowsystem,
  #wrapQtAppsHook,
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "xwaylandvideobridge-fix";
  version = "0.4.0";

  src = fetchgit {
    url = "https://github.com/hf-ikea/xwaylandvideobridge-fix.git";
    hash = "sha256-enuO8tPnzRxQ07vdw28tmrtVWCkubTnP/It4XKEKpFI=";
  };

  nativeBuildInputs = [
    cmake
    extra-cmake-modules
    pkg-config
    pkgs.kdePackages.wrapQtAppsHook
  ];

  buildInputs = [
    pkgs.kdePackages.qtbase
    pkgs.kdePackages.qtdeclarative
    #pkgs.libsForQt5.qt5.qtx11extras
    pkgs.kdePackages.kcoreaddons
    pkgs.kdePackages.ki18n
    pkgs.kdePackages.knotifications
    pkgs.kdePackages.kpipewire
    pkgs.kdePackages.kstatusnotifieritem
    pkgs.kdePackages.kwindowsystem
  ];

  cmakeFlags = ["-DQT_MAJOR_VERSION=${lib.versions.major pkgs.kdePackages.qtbase.version}"];

  meta = {
    description = "Utility to allow streaming Wayland windows to X applications";
    homepage = "https://invent.kde.org/system/xwaylandvideobridge";
    license = with lib.licenses; [
      bsd3
      cc0
      gpl2Plus
    ];
    maintainers = with lib.maintainers; [stepbrobd];
    platforms = lib.platforms.linux;
    mainProgram = "xwaylandvideobridge";
  };
})
