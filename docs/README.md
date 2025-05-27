# Nix Config
Based On [dustinlyons/nixos-config](https://github.com/dustinlyons/nixos-config).

```shell
darwin-rebuild switch --flake .#personal-mac
# OR
darwin-rebuild switch --flake .#work-mac

darwin-rebuild build --flake .#personal-mac

darwin-rebuild rollback

nix flake update
```