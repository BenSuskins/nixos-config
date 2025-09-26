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
    onActivation = {
      cleanup = "zap";
      upgrade = true;
      autoUpdate = true;
    };
    brews = [
    ];
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
    { path = "${pkgs.discord}/Applications/Discord.app"; }
    { path = "/System/Applications/Messages.app/"; }
    { path = "/System/Applications/Mail.app/"; }
    { path = "/System/Applications/Calendar.app/"; }
    { path = "${pkgs.ghostty-bin}/Applications/Ghostty.app"; }
    { path = "/Applications/Safari.app"; }
    { path = "/System/Applications/Notes.app/"; }
    { path = "/Applications/Music.app"; }
    { path = "/System/Applications/iPhone Mirroring.app/"; }
  ];
  local.dock.username = userInfo.username;
}
