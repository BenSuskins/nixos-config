{ pkgs }:

with pkgs;
[
  # General
  wget
  ripgrep
  fzf
  jq
  dockutil
  eza

  # Nix
  nixfmt-rfc-style
  
  # Git
  gh
  lazygit

  # Utilities
  maccy
  obsidian

  # Development
  vscode
  ghostty-bin
]
