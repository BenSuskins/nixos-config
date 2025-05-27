# Nix Config
Based On [dustinlyons/nixos-config](https://github.com/dustinlyons/nixos-config).

## General
```shell
nix flake update
```

## Personal Mac
```shell
darwin-rebuild switch --flake .#aarch64-darwin

darwin-rebuild build --flake .#aarch64-darwin

darwin-rebuild rollback
```

## Work Mac
```shell
darwin-rebuild switch --flake .#TODO

darwin-rebuild build --flake .#TODO

darwin-rebuild rollback
```