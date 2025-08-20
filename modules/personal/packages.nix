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

  # Node
  nodejs_22
]
