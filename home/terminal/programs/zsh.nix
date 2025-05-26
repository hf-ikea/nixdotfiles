{ flake
, lib
, osConfig
, ...
}:
let
  inherit (flake.config) params;
in
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting = {
      enable = true;
      patterns = { "rm -rf *" = "fg=black,bg=red"; };
      styles = { "alias" = "fg=magenta"; };
      highlighters = [ "pattern" "main" "brackets" ];
    };
    shellAliases = {
      ls = "ls --color=auto";
      nrebuild = "sudo nixos-rebuild switch --flake /etc/nixos#${params.hostname}";
    };
    history = {
      expireDuplicatesFirst = true;
      save = 10000;
    };
  };
  osConfig = {
    users.defaultUserShell = pkgs.zsh;
    programs.zsh = {
      enable = true;
    };
  };
}
