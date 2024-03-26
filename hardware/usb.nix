# usb.nix

{ config, pkgs, ... }:

{
  # Enable USB support
  boot.kernelModules = [ "xhci_pci" "nvme" "sdhci_pci" "sd_mod" "sr_mod" ];

  # Optionally configure additional USB-related settings here
}
