{
  config,
  pkgs,
  lib,
  home-manager,
  user,
  name,
  email,
  ...
}:

{
  imports = [
    ../shared/dock
  ];

  system.primaryUser = user;

  users.users.${user} = {
    name = "${user}";
    home = "/Users/${user}";
    isHidden = false;
    shell = pkgs.zsh;
  };

  homebrew = {
    enable = true;
    casks = pkgs.callPackage ./casks.nix { };
    onActivation.cleanup = "zap";
    masApps = {
      "WhatsApp Messenger" = 310633997;
    };
  };

  home-manager = {
    useGlobalPkgs = true;
    users.${user} =
      {
        pkgs,
        config,
        lib,
        ...
      }:
      {
        home = {
          enableNixpkgsReleaseCheck = false;
          packages = pkgs.callPackage ./packages.nix { };
          stateVersion = "23.11";
        };
        programs = {
          zsh = import ../shared/zsh.nix;
          git = import ../shared/git.nix { inherit name email; };
        };
      };
  };

  local.dock.enable = true;
  local.dock.entries = [
    { path = "/System/Applications/Launchpad.app"; }
    { path = "/Applications/Slack.app"; }
    { path = "/System/Applications/Messages.app/"; }
    { path = "/System/Applications/Calendar.app/"; }
    { path = "/System/Applications/Mail.app/"; }
    { path = "/Applications/Iterm.app"; }
    { path = "/Applications/Safari.app"; }
    { path = "/System/Applications/Notes.app/"; }
    { path = "/Applications/Spotify.app"; }
    { path = "/System/Applications/iPhone Mirroring.app/"; }
  ];
  local.dock.username = user;
}
