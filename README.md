# 🧑‍💻 Nix Config

My [Nix](https://nixos.org/) configuration for macOS, managed with flakes and [nix-darwin](https://github.com/LnL7/nix-darwin).

---

## 🏗️ Getting Started
1. Clone this repository:
   ```shell
   git clone https://github.com/BenSuskins/nixos-config.git
   cd nixos-config
   ```
2. **Install Nix and prerequisites:**  
   Run the provided bootstrap script:
   ```shell
   ./bootstrap.sh
   ```
3. Follow the usage instructions below.

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
# 🏗️ First time setup (before darwin-rebuild is available)
nix run nix-darwin -- switch --flake .#personal

# 🔨 Build system (after initial setup)
sudo darwin-rebuild build --flake .#personal

# 🚀 Deploy system (after initial setup)
sudo darwin-rebuild switch --flake .#personal

# ⏪ Rollback system
sudo darwin-rebuild rollback
```

## 💼 Work Mac 

```shell
# 🏗️ First time setup (before darwin-rebuild is available)
nix run nix-darwin -- switch --flake .#work

# 🔨 Build system (after initial setup)
sudo darwin-rebuild build --flake .#work

# 🚀 Deploy system (after initial setup)
sudo darwin-rebuild switch --flake .#work

# ⏪ Rollback system
sudo darwin-rebuild rollback
```
---

## 🛠️ Troubleshooting

- `Could not write domain com.apple.universalaccess; exiting`
  > ⚠️ Make sure you give **Full Disk Access** to the terminal you're using.

---

## 🙏 Acknowledgments

Based on [dustinlyons/nixos-config](https://github.com/dustinlyons/nixos-config). Thanks for the inspiration!

---

## 💼 Resources

- [Nix Manual](https://nixos.org/manual/nix/stable/)
- [Nix Flakes](https://nixos.wiki/wiki/Flakes)
