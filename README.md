# Nix Config

Nix flake-based macOS configuration using [nix-darwin](https://github.com/LnL7/nix-darwin) and [home-manager](https://github.com/nix-community/home-manager). Supports separate `personal` and `work` configurations.

## Setup

```shell
git clone https://github.com/BenSuskins/nixos-config.git
cd nixos-config
./bootstrap.sh
```

## Usage

```shell
# First-time setup
nix run nix-darwin -- switch --flake .#personal  # or .#work

# Build and apply changes
sudo darwin-rebuild switch --flake .#personal    # or .#work

# Build only (validate without applying)
sudo darwin-rebuild build --flake .#personal     # or .#work

# Rollback
sudo darwin-rebuild rollback

# Update flake inputs
nix flake update
```

## Troubleshooting

**`Could not write domain com.apple.universalaccess`**
Grant Full Disk Access to your terminal application.

## Resources

- [Nix Manual](https://nixos.org/manual/nix/stable/)
- [Nix Packages Search](https://search.nixos.org/packages)
- [Home Manager Options](https://home-manager-options.extranix.com)
- [nix-darwin Options](https://nix-darwin.github.io/nix-darwin/manual/)

## Acknowledgments

Based on [dustinlyons/nixos-config](https://github.com/dustinlyons/nixos-config).
