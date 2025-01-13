{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting = {
      enable = true;
      patterns = {"rm -rf *" = "fg=black,bg=red";};
      styles = {"alias" = "fg=magenta";};
      highlighters = ["pattern" "main" "brackets"];
    };
  };
}
