{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      llvm-vs-code-extensions.vscode-clangd
      wakatime.vscode-wakatime
      mshr-h.veriloghdl
      leonardssh.vscord
      rust-lang.rust-analyzer
    ];
    userSettings = {
      "vscord.status.buttons.button1.enabled" = false;
      "vscord.status.buttons.button1.git.idle.enabled" = false;
      "vscord.status.buttons.button1.git.inactive.enabled" = false;
    };
  };
}
