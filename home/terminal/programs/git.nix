{
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    userName = "hf-ikea";
    userEmail = "bluehairguyiscool@gmail.com";
    extraConfig = {
      push = {autoSetupRemote = true;};
    };
  };
}
