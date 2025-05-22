{ config
, pkgs
, ...
}: {
  programs.git = {
    enable = true;
    userName = "hf-ikea";
    userEmail = "forma3425@gmail.com";
    extraConfig = {
      push = { autoSetupRemote = true; };
      pull = { rebase = false; };
      init = { defaultBranch = "main"; };
    };
  };
}
