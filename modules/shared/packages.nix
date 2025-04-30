{ pkgs }:

with pkgs; [
  # General
  wget
  gh
  neovim
  killall
  jdk

  # Ansible
  ansible
  ansible-lint

  # Node
  nodePackages.npm
  nodejs

  # Go
  go
]
