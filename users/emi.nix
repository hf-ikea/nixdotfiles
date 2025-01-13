{
  lib,
  pkgs,
  config,
  ...
}: let
  wallpaper = "~/nixos/users/emipaper.png";
in {
  home.packages = [
    pkgs.alacritty
    pkgs.vesktop
    pkgs.hyprshot
    pkgs.wl-clipboard
    pkgs.prismlauncher
    pkgs.btop
    pkgs.fastfetch
    pkgs.ark
  ];

  home.file."${config.xdg.dataHome}/icons/" = {
    source = ../miscdot/cursor;
    recursive = true;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "alacritty";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
    settings = import ../modules/hyprland.nix;
  };

  programs.waybar = {
    enable = true;
    style = builtins.readFile ../modules/waybar.css;
    settings = import ../modules/waybar.nix;
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = false;
      #splash = false;
      preload = [
        (builtins.toString wallpaper)
      ];

      wallpaper = [
        ",${builtins.toString wallpaper}"
      ];
    };
  };

  programs.wofi = {
    enable = true;
  };

  programs.git = {
    enable = true;
    userName = "hf-ikea";
    userEmail = "bluehairguyiscool@gmail.com";
    extraConfig = {
      push = {autoSetupRemote = true;};
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ls = "ls --color=auto";
    };
    history.save = 10000;
    oh-my-zsh = {
      enable = true;
      plugins = ["git"];
    };
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  programs.firefox = {
    enable = true;
  };

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
    ];
  };

  gtk = {
    enable = true;
    cursorTheme = {
      name = "BreezeX-RoséPine";
      package = pkgs.rose-pine-cursor;
    };
  };
}
