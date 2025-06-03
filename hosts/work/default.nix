{ config, pkgs, ... }:

let
  user = "bsuskins";
in

{
  imports = [
    ../../modules/work/home.nix
    ../../modules/shared
    ../../modules/shared
    ../../modules/shared/system.nix
  ];

  nix = {
    package = pkgs.nix;
    enable = false;
  };

  system.checks.verifyNixPath = false;

  system.primaryUser = user;

  environment.systemPackages =
    with pkgs;
    [
    ]
    ++ (import ../../modules/shared/packages.nix { inherit pkgs; });

  security.pam.services.sudo_local.touchIdAuth = true;
}
