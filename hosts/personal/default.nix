{ config, pkgs, ... }:

let user = "bensuskins"; in

{
  imports = [
    ../../modules/personal/home.nix
    ../../modules/shared
    ../../modules/shared/fonts.nix
  ];

  nix = {
    package = pkgs.nix;
    enable = false;
  };

  system.checks.verifyNixPath = false;
  
  system.primaryUser = user;

  environment.systemPackages = with pkgs; [
  ] ++ (import ../../modules/shared/packages.nix { inherit pkgs; });

  security.pam.services.sudo_local.touchIdAuth = true;

  system = {
    stateVersion = 4;

    defaults = {
      NSGlobalDomain = {
        "com.apple.keyboard.fnState" = false;
        "com.apple.mouse.tapBehavior" = 1;
      };

      dock = {
        autohide = true;
        orientation = "bottom";
        largesize = 66;
        tilesize = 58;
        magnification = true;
        show-recents = false;
      };

      finder = {
        AppleShowAllExtensions = true;
        ShowPathbar = true;
        AppleShowAllFiles = true;
        FXPreferredViewStyle = "icnv";
        FXEnableExtensionChangeWarning = false;
      };

      trackpad = {
        Clicking = true;
      };
    };
  };
}
