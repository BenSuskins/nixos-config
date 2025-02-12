{ pkgs }:

with pkgs; [
  # General
  wget
  gh
  neovim
  killall

  # Ansible
  ansible
  ansible-lint

  # Go
  go
]
