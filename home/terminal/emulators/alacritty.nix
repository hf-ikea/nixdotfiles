{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal.family = "JetBrains Mono";
        bold.family = "JetBrains Mono";
        italic.family = "JetBrains Mono";
        size = 11;
      };
    };
  };
  home.sessionVariables = {
    TERMINAL = "alacritty";
  };
}
