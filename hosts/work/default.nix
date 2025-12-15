{ config, pkgs, ... }:

{
  imports = [
    ../../modules/work/home.nix
    ../../modules/shared
    # ../../modules/shared/fonts.nix
    ../../modules/shared/system.nix
  ];

  nix = {
    package = pkgs.nix;
    enable = false;
  };

  homebrew.taps = builtins.attrNames config.nix-homebrew.taps;

  security.pam.services.sudo_local.touchIdAuth = true;
}
