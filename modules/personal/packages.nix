{ pkgs }:

with pkgs;
let
  shared-packages = import ../shared/packages.nix { inherit pkgs; };
in
shared-packages
++ [
  # Ansible
  ansible
  ansible-lint

  # Communication Tools
  discord

  # Java
  jetbrains.idea-community

  # Gaming
  steam
]
