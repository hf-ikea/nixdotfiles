{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
        llvm-vs-code-extensions.vscode-clangd
        wakatime.vscode-wakatime
        mshr-h.veriloghdl
        leonardssh.vscord
        rust-lang.rust-analyzer
      ];
      userSettings = {
        "editor.fontSize" = 14;
        "editor.fontFamily" = "'JetBrains Mono', 'monospace', monospace";
        "files.autoSave" = "afterDelay";
        "git.confirmSync" = false;
        "vscord.status.buttons.button1.enabled" = false;
        "vscord.status.buttons.button1.git.idle.enabled" = false;
        "vscord.status.buttons.button1.git.inactive.enabled" = false;
        "git.enableSmartCommit" = true;
        "git.autofetch" = true;
      };
    };
  };
}
