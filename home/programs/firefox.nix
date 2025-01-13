{
  inputs,
  config,
  pkgs,
  ...
}: {
  programs.firefox = {
    enable = true;
    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;
      extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
        ublock-origin
        bitwarden
        darkreader
        vimium
      ];
    };
  };
}
