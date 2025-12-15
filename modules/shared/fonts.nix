{ pkgs, lib, ... }:

let
  # Only include fonts that exist for the current system
  availableFonts = lib.filter (f: f != null) [
    pkgs.nerd-fonts.fira-code
    pkgs.nerd-fonts.jetbrains-mono
  ];
in
{
  fonts = {
    enable = true;  # make sure fonts module is enabled
    packages = availableFonts;
  };
}