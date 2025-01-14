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
    profileExtra = "if uwsm check may-start && uwsm select; then
	    exec systemd-cat -t uwsm_start uwsm start default
    fi";
    shellAliases = {
      ls = "ls --color=auto";
    };
    history = {
      expireDuplicatesFirst = true;
      save = 10000;
    };
    oh-my-zsh = {
      enable = true;
      plugins = ["git"];
    };
  };
}
