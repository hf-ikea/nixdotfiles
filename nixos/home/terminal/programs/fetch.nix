{
  programs.hyfetch = {
    enable = true;
    settings = {
      preset = "transgender";
      backend = "fastfetch";
      mode = "rgb";
      color_align = {
        mode = "horizontal";
      };
    };
  };
  programs.fastfetch = {
    enable = true;
  };
}
