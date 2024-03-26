{
  environment = {
    # Set GTK theme
    variables.GTK_THEME = "Catppuccin-Macchiato-Standard-Teal-Dark";

    # Set XCursor theme and size
    variables.XCURSOR_THEME = "Catppuccin-Macchiato-Teal";
    variables.XCURSOR_SIZE = "24";

    # Set paths for Spotify, JDK, and Node.js
    variables.SPOTIFY_PATH = "${pkgs.spotify}/";
    variables.JDK_PATH = "${pkgs.jdk11}/";
    variables.NODEJS_PATH = "${pkgs.nodePackages_latest.nodejs}/";

    # Enable Continuous Integration
    variables.CI = "1";

    # Clipboard settings
    variables.CLIPBOARD_EDITOR = "hx";
    variables.CLIPBOARD_NOAUDIO = "1";
    variables.CLIPBOARD_NOGUI = "1";
    variables.CLIPBOARD_NOPROGRESS = "1";
    variables.CLIPBOARD_NOREMOTE = "1";
    variables.CLIPBOARD_SILENT = "1";

    # Set session variables for NixOS Ozone and Wayland
    sessionVariables.NIXOS_OZONE_WL = "1";
    sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
  };
}
