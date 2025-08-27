{ pkgs }:

with pkgs;
let
  shared-packages = import ../shared/packages.nix { inherit pkgs; };
in
shared-packages
++ [
  # Containers
  podman
  podman-compose
  podman-desktop

  # Collaboration Tools
  mob

  # Go
  go

  # Java
  jdk
  jetbrains.idea-ultimate

  # Node
  nodejs_22
]
