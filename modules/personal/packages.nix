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

  # AI

  # Containers
  podman
  podman-compose

  # Communication Tools
  discord
  
  # Diagramming Tools
  drawio

  # Go
  go
  jetbrains.goland

  # Java
  jdk
  jetbrains.idea-community

  # Node
  nodejs_22
]
