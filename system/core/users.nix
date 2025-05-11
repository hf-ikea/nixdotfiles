{pkgs, ...}: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.emi = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "emi";
    extraGroups = ["networkmanager" "wheel" "config.services.kubo.group"];
    packages = with pkgs; [
      devenv
    ];
  };
}
