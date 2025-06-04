{
  config,
  pkgs,
  lib,
  home-manager,
  userInfo,
  hostRole,
  ...
}:

{
  imports = [
    ../shared/dock
  ];

  system.primaryUser = userInfo.username;

  users.users.${userInfo.username} = {
    name = "${userInfo.username}";
    home = "/Users/${userInfo.username}";
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
    users.${userInfo.username} =
      {
        pkgs,
        config,
        lib,
        ...
      }:
      {
        home = {
          file = import ../shared/files.nix { inherit hostRole; };
          sessionPath = [
            "$HOME/.local/bin"
          ];
          enableNixpkgsReleaseCheck = false;
          packages = pkgs.callPackage ./packages.nix { };
          stateVersion = "23.11";
        };
        programs = import ../shared/programs.nix { inherit pkgs userInfo hostRole; };
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
