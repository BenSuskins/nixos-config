{ config, pkgs, ... }:

let
  user = "bensuskins";
in

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

  system.checks.verifyNixPath = false;
  system.primaryUser = user;
  security.pam.services.sudo_local.touchIdAuth = true;
}
