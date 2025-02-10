{ pkgs }:

with pkgs; [
  # General
  wget
  gh
  neovim
  killall

  # Terminal Config
  pure-prompt
  
  # Ansible
  ansible
  ansible-lint

  # Go
  go
]
