{ pkgs }:

with pkgs;
[
  # General
  wget
  ripgrep
  fzf
  jq
  dockutil

  # Nix
  nixfmt-rfc-style
  
  # Git
  gh
  lazygit

  # Utilities
  maccy

  # Development
  vscode
]
