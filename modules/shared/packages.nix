{ pkgs }:

with pkgs; [
  # General
  wget
  gh
  neovim
  killall
  jdk
  docker

  # Ansible
  ansible
  ansible-lint

  # Node
  nodePackages.npm
  nodejs

  # Go
  go
]
