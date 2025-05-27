{ pkgs, osConfig, ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting ""
      tide configure --auto --style=Rainbow --prompt_colors='True color' --show_time='12-hour format' --rainbow_prompt_separators=Angled --powerline_prompt_heads=Sharp --powerline_prompt_tails=Flat --powerline_prompt_style='Two lines, character and frame' --prompt_connection=Dotted --powerline_right_prompt_frame=Yes --prompt_connection_andor_frame_color=Lightest --prompt_spacing=Compact --icons='Many icons' --transient=No
    '';
    shellAliases = {
      l = "ls -lah --color=auto";
      ls = "ls --color=auto";
      nrebuild = "sudo nixos-rebuild switch --flake /etc/nixos#${osConfig.networking.hostName} --show-trace";
    };
    shellAbbrs = {
      nfmt = "nix fmt -- **/*.nix";
    };
    plugins = [
      { name = "z"; src = pkgs.fishPlugins.z.src; }
      { name = "tide"; src = pkgs.fishPlugins.tide.src; }
      { name = "fzf"; src = pkgs.fishPlugins.fzf-fish.src; }
      { name = "autopair"; src = pkgs.fishPlugins.autopair.src; }
      { name = "wakatime-fish"; src = pkgs.fishPlugins.wakatime-fish.src; }
    ];
  };
}
