{
  config,
  pkgs,
  lib,
  home-manager,
  ...
}:

let
  user = "bsuskins";
  name = "Ben Suskins";
  email = "bsuskins@ford.com";
in
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
    { path = "/System/Applications/Notes.app"; }
    { path = "/Applications/Miro.app"; }
    { path = "/Applications/Iterm.app"; }
    { path = "/Applications/IntelliJ IDEA.app"; }
    { path = "/Applications/Visual Studio Code.app"; }
    { path = "/Applications/Microsoft Edge.app"; }
    { path = "/Applications/Slack.app"; }
    { path = "/Applications/Microsoft Teams.app"; }
    { path = "/System/Applications/Reminders.app/"; }
  ];
  local.dock.username = user;
}
