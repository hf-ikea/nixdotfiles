{ flake
, pkgs
, ...
}: {
  imports = [
    flake.inputs.spicetify-nix.homeManagerModules.default
  ];

  programs.spicetify =
    let
      spicePkgs = flake.inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        adblock
        shuffle # shuffle+ (special characters are sanitized out of extension names)
        groupSession
        powerBar
        fullAlbumDate
        skipStats
        songStats
        showQueueDuration
        lastfm
        betterGenres
        volumePercentage
      ];
      theme = spicePkgs.themes.catppuccin;
      colorScheme = "mocha";
    };
}
