# 🧑‍💻 Nix Config

Based On [dustinlyons/nixos-config](https://github.com/dustinlyons/nixos-config).

## 🛠️ General

```shell
# 🔄 Update Flakes
nix flake update

# 🔍 See difference in build
nix store diff-closures /run/current-system ./result
```

## 🏡 Personal Mac

```shell
# 🏗️ Build system
sudo darwin-rebuild build --flake .#personal

# 🚀 Deploy system
sudo darwin-rebuild switch --flake .#personal

# ⏪ Rollback system
sudo darwin-rebuild rollback
```

## 💼 Work Mac

```shell
# 🏗️ Build system
sudo darwin-rebuild build --flake .#work

# 🚀 Deploy system
sudo darwin-rebuild switch --flake .#work

# ⏪ Rollback system
sudo darwin-rebuild rollback
```

# 🛠️ Troubleshooting

`Could not write domain com.apple.universalaccess; exiting`  
> ⚠️ Make sure you give **Full Disk Access** to the terminal

# 🙏 Acknowledgments

Based on [dustinlyons/nixos-config](https://github.com/dustinlyons/nixos-config). Thanks for the inspiration!
