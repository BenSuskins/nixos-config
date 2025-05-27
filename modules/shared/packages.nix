{ pkgs }:

with pkgs; [
  # General
  wget
  neovim

  # Ansible
  ansible
  ansible-lint

  # Github
  gh

  # Java 
  jdk

  # Node
  nodePackages.npm
  nodejs

  # Go
  go
]
