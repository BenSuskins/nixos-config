{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true; # Ensures system fonts are available
    packages = with pkgs; [
      noto-fonts
      noto-fonts-emoji
      fira-code
      fira-code-nerdfont
      jetbrains-mono
      roboto
    ];
  };
}