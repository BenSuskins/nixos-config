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

  # Go
  go
]
