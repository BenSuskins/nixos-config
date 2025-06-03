{ ... }:

{
  system = {
    stateVersion = 4;
    checks.verifyNixPath = false;

    defaults = {
      NSGlobalDomain = {
        "com.apple.keyboard.fnState" = false;
        "com.apple.mouse.tapBehavior" = 1;
      };

      universalaccess = {
        closeViewScrollWheelToggle = true;
      };

      menuExtraClock = {
        Show24Hour = true;
        ShowSeconds = true;
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

      controlcenter = {
        Bluetooth = true;
        Sound = true;
      };

      trackpad = {
        Clicking = true;
      };
    };
  };
}
