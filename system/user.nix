{
  # Define user-specific configurations
  users.users.rr-h = {
    isNormalUser = true;
    description = "Ricardo";
    extraGroups = [ "networkmanager" "wheel" ]; # Additional groups
    packages = with pkgs; [ vim wget ]; # User-specific packages
  };

  # Define sudo rules for the user
  security.sudo.extraRules = [
    {
      groups = [ "wheel" ]; # Sudo group
      commands = [
        "${pkgs.systemd}/bin/systemctl suspend" # Suspend command
        "${pkgs.systemd}/bin/reboot" # Reboot command
        "${pkgs.systemd}/bin/poweroff" # Power off command
        "/run/current-system/sw/bin/nixos-rebuild" # NixOS rebuild command
        "${pkgs.neovim}/bin/nvim" # Neovim command
        "${pkgs.systemd}/bin/systemctl" # Systemctl command
        "/run/current-system/sw/bin/ln" # Symbolic link command
        "/run/current-system/sw/bin/nix-channel" # Nix channel command
      ];
      options = [ "NOPASSWD" ]; # Options for sudo rules
    }
  ];
}

