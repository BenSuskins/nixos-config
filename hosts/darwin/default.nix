{ config, pkgs, ... }:

let user = "bensuskins"; in

{
  imports = [
    ../../modules/darwin/home-manager.nix
    ../../modules/shared
  ];

  services.nix-daemon.enable = true;

  nix = {
    package = pkgs.nix;
    enable = false;
    settings = {
      trusted-users = [ "@admin" "${user}" ];
      substituters = [ "https://nix-community.cachix.org" "https://cache.nixos.org" ];
      trusted-public-keys = [ "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" ];
    };

    gc = {
      user = "root";
      automatic = true;
      interval = { Weekday = 0; Hour = 2; Minute = 0; };
      options = "--delete-older-than 30d";
    };

    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  system.checks.verifyNixPath = false;

  environment.systemPackages = with pkgs; [
  ] ++ (import ../../modules/shared/packages.nix { inherit pkgs; });

  security.pam.enableSudoTouchIdAuth = true;

  system = {
    stateVersion = 4;

    defaults = {
      NSGlobalDomain = {
        "com.apple.keyboard.fnState" = false;
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
