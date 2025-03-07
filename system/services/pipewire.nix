{lib, ...}: {
  # wiki says so
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
        "default.allowed-rates" = [192000 48000 44100];
        #"default.clock.quantum" = 32;
        #"default.clock.min-quantum" = 32;
        #"default.clock.max-quantum" = 32;
      };
    };
  };

  services.pulseaudio.enable = lib.mkForce false;
}
