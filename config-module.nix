{ lib
, ...
}:
with lib; {
  options = {
    params = mkOption {
      default = { };
      type = types.submodule {
        options = {
          username = mkOption {
            type = types.str;
            default = "emi";
          };
          wallpaper = mkOption {
            type = types.str;
            default = "/etc/nixos/wallpaper.png";
          };
        };
      };
    };
  };
}
