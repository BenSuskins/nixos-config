{ config, pkgs, ... }:

let
  user = "bsuskins";
in

{
  imports = [
    ../../modules/work/home.nix
    ../../modules/shared
    ../../modules/shared/fonts.nix
    ../../modules/shared/system.nix
  ];

  nix = {
    package = pkgs.nix;
    enable = false;
  };

  system.checks.verifyNixPath = false;
  system.primaryUser = user;
  security.pam.services.sudo_local.touchIdAuth = true;
}
