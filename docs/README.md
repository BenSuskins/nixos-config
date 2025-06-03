# Nix Config
Based On [dustinlyons/nixos-config](https://github.com/dustinlyons/nixos-config).

## General
```shell
# Update Flakes
nix flake update

# See difference in build
nix store diff-closures /run/current-system ./result
```

## Personal Mac
```shell
# Build system
sudo darwin-rebuild build --flake .#aarch64-darwin

# Deploy system
sudo darwin-rebuild switch --flake .#aarch64-darwin

# Rollback system
sudo darwin-rebuild rollback
```

## Work Mac
```shell
# Build system
sudo darwin-rebuild build --flake .#TODO

# Deploy system
sudo darwin-rebuild switch --flake .#TODO

# Rollback system
sudo darwin-rebuild rollback
```

# Troubleshotting

`Could not write domain com.apple.universalaccess; exiting`
> Make sure you give full disk access to the terminal you're using