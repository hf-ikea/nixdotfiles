{ lib
, flake
, pkgs
, ...
}:
let
  inherit (flake.config) params;
in
{
  environment.systemPackages = with pkgs; [
    nixd
  ];

  # Enable networking
  networking.networkmanager.enable = true;

  users = {
    defaultUserShell = pkgs.bash;
    groups.${params.username} = { };
    users.${params.username} = {
      isNormalUser = lib.mkForce true;
      isSystemUser = lib.mkForce false;
      description = params.username;
      group = params.username;
      extraGroups = [ "networkmanager" "wheel" "plugdev" "dialout" params.username ];
      # packages = with pkgs; [
      #   hello
      # ];
    };
  };

  home-manager = {
    backupFileExtension = "backup";
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${params.username} = {
      home = {
        stateVersion = "24.11";
        homeDirectory = lib.mkForce "/home/${params.username}";
      };
    };
  };

  # fish cant be login shell :((
  programs.bash = {
    interactiveShellInit = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };
  programs.foot = {
    enableFishIntegration = true;
  };

  nix = {
    settings = {
      trusted-users = [ "root" params.username ];
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  system.userActivationScripts = {
    removeConflictingFiles = {
      text = ''
        rm -f /home/${params.username}/.gtkrc-2.0.backup
        rm -f /home/${params.username}/.config/vesktop/settings/settings.json
        #rm -f /home/${params.username}/.config/Code/User/settings.json
      '';
    };
  };

  fonts.packages = with pkgs; [
    font-awesome
    jetbrains-mono
    liberation_ttf
    meslo-lgs-nf
  ];

  programs.dconf.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  networking.firewall = {
    enable = true;
    allowedTCPPortRanges = [
      {
        from = 1714;
        to = 1764;
      } # KDE Connect
    ];
    allowedUDPPortRanges = [
      {
        from = 1714;
        to = 1764;
      } # KDE Connect
    ];
  };

  # AUDIO
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    extraConfig.pipewire.adjust-sample-rate = {
      "context.properties" = {
        "default.clock.rate" = 192000;
        "default.allowed-rates" = [ 192000 48000 44100 ];
        #"default.clock.quantum" = 32;
        #"default.clock.min-quantum" = 32;
        #"default.clock.max-quantum" = 32;
      };
    };
  };
  services.pulseaudio.enable = lib.mkForce false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment? no
}
