{config, ...}: {
  imports = [
    ./programs
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "alacritty";
  };
}
