{
  config,
  pkgs,
  lib,
  home-manager,
  ...
}:

let
  user = "bensuskins";
  name = "Ben Suskins";
  email = "suskinsdevelopment@gmail.com";
in
{
  imports = [
    ./dock
  ];

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
        # Marked broken Oct 20, 2022 check later to remove this
        # https://github.com/nix-community/home-manager/issues/3344
        manual.manpages.enable = false;
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
