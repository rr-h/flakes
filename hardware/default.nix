{
  imports = [];
}

# This Nix expression sets up a development environment for a KDE Plasma user.
{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  # Environment variables
  shellHook = ''
    export EDITOR=vim
  '';

  # Packages to include in the shell environment
  buildInputs = with pkgs; [
    git
    vim
    kdeApplications.konsole
    kdeApplications.dolphin
    cmake
    ninja
    qt5.qtbase
    qt5.qtcreator # If you're doing Qt development, for example
    gdb
    clang
    llvmPackages.llvm
  ];

  # Additional KDE and Qt environment setup can go here.
  # This is just a basic setup and can be extended as needed.
}
