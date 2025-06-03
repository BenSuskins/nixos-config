{ config, pkgs, ... }:

{
  imports = [
    ../../modules/personal/home.nix
    ../../modules/shared
    ../../modules/shared/fonts.nix
    ../../modules/shared/system.nix
  ];

  nix = {
    package = pkgs.nix;
    enable = false;
  };

  security.pam.services.sudo_local.touchIdAuth = true;
}
