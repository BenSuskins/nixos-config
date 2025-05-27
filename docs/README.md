# Nix Config
Based On [dustinlyons/nixos-config](https://github.com/dustinlyons/nixos-config).

## General
```shell
nix flake update
```

## Personal Mac
```shell
sudo darwin-rebuild switch --flake .#aarch64-darwin

sudo darwin-rebuild build --flake .#aarch64-darwin

sudo darwin-rebuild rollback
```

## Work Mac
```shell
sudo darwin-rebuild switch --flake .#TODO

sudo darwin-rebuild build --flake .#TODO

sudo darwin-rebuild rollback
```