{ pkgs }:

with pkgs;
let shared-packages = import ../shared/packages.nix { inherit pkgs; }; in
shared-packages ++ [
  # Ansible
  ansible
  ansible-lint

  # Go
  go

  # Java 
  jdk

  # Node
  nodePackages.npm
  nodejs
]
