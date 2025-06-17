# 🧑‍💻 Nix Config

My [Nix](https://nixos.org/) configuration for macOS, managed with flakes and [nix-darwin](https://github.com/LnL7/nix-darwin).

---

## 💾 Getting Started
1. Clone this repository (if you haven't already):
   ```shell
   git clone https://github.com/yourusername/nixos-config.git
   cd nixos-config
   ```
1. **Install Nix and prerequisites:**  
   Run the provided bootstrap script:
   ```shell
   ./bootstrap.sh
   ```
1. **Initial run:**  
   Run the provided bootstrap script:
   ```shell
   TODO
   ```   
1. Follow the usage instructions below.

---

## 💻 General Usage

```shell
# 🔄 Update Flakes
nix flake update

# 🔍 See difference in build
nix store diff-closures /run/current-system ./result
```

---

## 🏡 Personal Mac

```shell
# 🏗️ Build system
sudo darwin-rebuild build --flake .#personal

# 🚀 Deploy system
sudo darwin-rebuild switch --flake .#personal

# ⏪ Rollback system
sudo darwin-rebuild rollback
```

---

## 🗄️ Work Mac

```shell
# 🏗️ Build system
sudo darwin-rebuild build --flake .#work

# 🚀 Deploy system
sudo darwin-rebuild switch --flake .#work

# ⏪ Rollback system
sudo darwin-rebuild rollback
```

---

## 🛠️ Troubleshooting

`Could not write domain com.apple.universalaccess; exiting`  
> ⚠️ Make sure you give **Full Disk Access** to the terminal you're using.

---

## 🙏 Acknowledgments

Based on [dustinlyons/nixos-config](https://github.com/dustinlyons/nixos-config). Thanks for the inspiration!

---

## 💼 Resources

- [Nix Manual](https://nixos.org/manual/nix/stable/)
- [Nix Flakes](https://nixos.wiki/wiki/Flakes)
