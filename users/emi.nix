{
  lib,
  pkgs,
  config,
  ...
}: {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "emi";
  home.homeDirectory = "/home/emi";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.packages = [
    pkgs.alacritty
    pkgs.firefox
    pkgs.vesktop
    pkgs.hyprshot
    pkgs.wl-clipboard
    pkgs.prismlauncher
    pkgs.hyprpaper

    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
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
      splash = false;
      preload = [
        "./emipaper.png"
      ];

      wallpaper = [
        ",../users/emipaper.png"
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
    viAlias = true;
    vimAlias = true;
  };
}
