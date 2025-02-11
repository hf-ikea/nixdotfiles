{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      llvm-vs-code-extensions.vscode-clangd
      wakatime.vscode-wakatime
      mshr-h.veriloghdl
    ];
  };
}
