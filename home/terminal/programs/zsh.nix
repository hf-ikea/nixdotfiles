{
  config,
  lib,
  ...
}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting = {
      enable = true;
      patterns = {"rm -rf *" = "fg=black,bg=red";};
      styles = {"alias" = "fg=magenta";};
      highlighters = ["pattern" "main" "brackets"];
    };
    shellAliases = {
      ls = "ls --color=auto";
    };
    history = {
      expireDuplicatesFirst = true;
      save = 10000;
    };
  };
}
