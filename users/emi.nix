{
  lib,
  pkgs,
  config,
  ...
}: {
  imports = [
    ../modules/hyprpaper.nix
  ];

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
    settings = {
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "rgb(ff5bf0) rgb(ffffff) rgb(33ccff) 45deg";
        "col.inactive_border" = "rgb(595959)";
        resize_on_border = false;
        allow_tearing = false;
        layout = "dwindle";
      };

      "$mod" = "LALT";
      "$terminal" = "alacritty";
      "$menu" = "wofi --show drun";
      "$snip" = "hyprshot --clipboard-only -m region";
      bind = [
        "$mod, Q, killactive,"
        "$mod, Return, exec, $terminal"
        "$mod SHIFT, p, exit,"
        "$mod, Space, exec, $menu"
        "$mod, N, exec, $snip"
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"
      ];
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
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
