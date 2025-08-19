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

  # Podman
  podman
  podman-compose

  # Go
  go

  # Java
  jdk

  # Node
  nodejs_22
]
