{
  programs.waybar = {
    enable = true;
    style = builtins.readFile ./waybar.css;
    settings = {
      mainbar = {
        layer = "top";
        position = "top";

        "modules-left" = [
          "hyprland/workspaces"
          "custom/arrow10"
          "hyprland/window"
        ];

        "modules-right" = [
          "custom/arrow9"
          "pulseaudio"
          "custom/arrow8"
          "network"
          "custom/arrow7"
          "memory"
          "custom/arrow6"
          "cpu"
          "custom/arrow5"
          "temperature"
          "custom/arrow2"
          "clock#date"
          "custom/arrow1"
          "clock#time"
        ];

        "clock#time" = {
          "interval" = 10;
          "format" = "{:%I:%M %p}";
          "tooltip" = false;
        };

        "clock#date" = {
          "interval" = 20;
          "format" = "{:%e %b %Y}";
          "tooltip" = false;
        };

        "cpu" = {
          "interval" = 5;
          "tooltip" = false;
          "format" = " {usage}%";
          "format-alt" = " {load}";
        };

        "memory" = {
          "interval" = 5;
          "format" = " {used:0.1f}G/{total:0.1f}G";
          "tooltip" = false;
        };

        "network" = {
          "interval" = 5;
          "format-wifi" = " {essid} ({signalStrength}%)";
          "format-ethernet" = " {ifname}";
          "format-disconnected" = "No connection";
          "format-alt" = " {ipaddr}/{cidr}";
          "tooltip" = false;
        };

        "hyprland/window" = {
          "tooltip" = false;
        };

        "hyprland/workspaces" = {
          "disable-scroll-wraparound" = true;
          "smooth-scrolling-threshold" = 4;
          "enable-bar-scroll" = true;
          "format" = "{name}";
        };

        "pulseaudio" = {
          "format" = "{icon} {volume}%";
          "format-bluetooth" = "{icon} {volume}%";
          "format-muted" = " MUTE";
          "format-icons" = {
            "headphone" = "";
            "hands-free" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = [
              ""
              ""
            ];
          };
          "scroll-step" = 1;
          "on-click" = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
          "tooltip" = false;
        };

        "temperature" = {
          "hwmon-path" = "/sys/devices/pci0000:00/0000:00:18.3/hwmon/hwmon0/temp1_input";
          "interval" = 5;
          "format" = "{icon} {temperatureC}°";
          "format-icons" = [
            ""
            ""
            ""
            ""
            ""
          ];
          "tooltip" = false;
        };

        "tray" = {
          "icon-size" = 10;
        };

        "custom/arrow1" = {
          "format" = "";
          "tooltip" = false;
        };

        "custom/arrow2" = {
          "format" = "";
          "tooltip" = false;
        };

        "custom/arrow5" = {
          "format" = "";
          "tooltip" = false;
        };

        "custom/arrow6" = {
          "format" = "";
          "tooltip" = false;
        };

        "custom/arrow7" = {
          "format" = "";
          "tooltip" = false;
        };

        "custom/arrow8" = {
          "format" = "";
          "tooltip" = false;
        };

        "custom/arrow9" = {
          "format" = "";
          "tooltip" = false;
        };

        "custom/arrow10" = {
          "format" = "";
          "tooltip" = false;
        };
      };
    };
  };
}
