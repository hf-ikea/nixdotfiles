{ flake, lib, pkgs, ... }: {
  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "mauve";
    vscode = {
      accent = "mauve";
      settings = {
        boldKeywords = true;
        italicComments = true;
        italicKeywords = true;
        colorOverrides = { };
        customUIColors = { };
        workbenchMode = "default";
        bracketMode = "rainbow";
        extraBordersEnabled = false;
      };
    };
    # foot = {
    #   enable = true;
    #   flavor = "mocha";
    # };
  };
}
