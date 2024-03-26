{ config, pkgs, ... }:

{
  imports = [
    ./boot.nix
    ./environment.nix
    ./networking.nix
    ./pkgs.nix
    ./services.nix
    ./user.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "nixos"; 
    wireless.enable = true;
    networkmanager.enable = true;
  };

  time.timeZone = "Europe/London";
  i18n = {
    defaultLocale = "en_GB.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_GB.UTF-8";
      LC_IDENTIFICATION = "en_GB.UTF-8";
      LC_MEASUREMENT = "en_GB.UTF-8";
      LC_MONETARY = "en_GB.UTF-8";
      LC_NAME = "en_GB.UTF-8";
      LC_NUMERIC = "en_GB.UTF-8";
      LC_PAPER = "en_GB.UTF-8";
      LC_TELEPHONE = "en_GB.UTF-8";
      LC_TIME = "en_GB.UTF-8";
    };
  };

  services.xserver.enable = true;
  services.xserver.layout = "gb";
  services.xserver.xkbVariant = "mac";
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  networking.networkmanager.enable = true;

  environment.systemPackages = with pkgs; [
    kdeApplications.konsole
    kdeApplications.dolphin
  ];

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  users.users.rr-h = {
    isNormalUser = true;
    description = "Ricardo";
    extraGroups = [ "networkmanager", "wheel" ];
    packages = with pkgs; [ vim wget ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [ vim wget ];

  security.sudo.enable = true;
  security.sudo.extraRules = [
    {
      groups = [ "wheel" ];
      commands = [
        { command = "${pkgs.systemd}/bin/systemctl suspend"; options = [ "NOPASSWD" ]; }
        { command = "${pkgs.systemd}/bin/reboot"; options = [ "NOPASSWD" ]; }
        { command = "${pkgs.systemd}/bin/poweroff"; options = [ "NOPASSWD" ]; }
        { command = "/run/current-system/sw/bin/nixos-rebuild"; options = [ "NOPASSWD" ]; }
        { command = "${pkgs.neovim}/bin/nvim"; options = [ "NOPASSWD" ]; }
        { command = "${pkgs.systemd}/bin/systemctl"; options = [ "NOPASSWD" ]; }
        { command = "/run/current-system/sw/bin/ln"; options = [ "NOPASSWD" ]; }
        { command = "/run/current-system/sw/bin/nix-channel"; options = [ "NOPASSWD" ]; }
      ];
    }
  ];

  services.openssh.enable = true;

  system.stateVersion = "23.05"; 

  # Additional configurations can be added here based on your requirements.
}
