{ config, pkgs, lib, home-manager, ... }:

let
  user = "bensuskins";
  name = "Ben Suskins";
  email = "suskinsdevelopment@gmail.com";
in
{
  imports = [
   ./dock
  ];

  # It me
  users.users.${user} = {
    name = "${user}";
    home = "/Users/${user}";
    isHidden = false;
    shell = pkgs.zsh;
  };

  homebrew = {
    enable = true;
    casks = pkgs.callPackage ./casks.nix {};
    # onActivation.cleanup = "uninstall";
    masApps = {
      "WhatsApp Messenger" = 310633997;
    };
  };

  # Enable home-manager
  home-manager = {
    useGlobalPkgs = true;
    users.${user} = { pkgs, config, lib, ... }:{
      home = {
        enableNixpkgsReleaseCheck = false;
        packages = pkgs.callPackage ./packages.nix {};
        stateVersion = "23.11";
      };
      programs = {
        zsh = {
          enable = true;
          autocd = false;
          plugins = [
            {
              name = "pure";
              file = "pure.zsh";
              src = builtins.fetchGit {
                url = "https://github.com/sindresorhus/pure";
                rev = "92b8e9057988566b37ff695e70e2e9bbeb7196c8";
              };
            }
            {
              name = "zsh-syntax-highlighting";
              file = "zsh-syntax-highlighting.zsh";
              src = builtins.fetchGit {
                url = "https://github.com/zsh-users/zsh-syntax-highlighting/";
                rev = "5eb677bb0fa9a3e60f0eff031dc13926e093df92";
              };
            }
            {
              name = "zsh-autosuggestions";
              file = "zsh-autosuggestions.zsh";
              src = builtins.fetchGit {
                url = "https://github.com/zsh-users/zsh-autosuggestions";
                rev = "0e810e5afa27acbd074398eefbe28d13005dbc15";
              };
            }
            {
              name = "z";
              file = "z.sh";
              src = builtins.fetchGit {
                url = "https://github.com/rupa/z";
                rev = "d37a763a6a30e1b32766fecc3b8ffd6127f8a0fd";
              };
            }
          ];
          initExtraFirst = ''
            # General
            alias nixconfig="code ~/workspace/nixos-config"
            alias rebuild="cd ~/workspace/BenSuskins/dotfiles && sudo darwin-rebuild build --flake .#aarch64-darwin"
            alias switch="cd ~/workspace/BenSuskins/dotfiles && sudo darwin-rebuild switch --flake .#aarch64-darwin"

            # SSH
            alias sshmedia='ssh -i ~/.ssh/homelab mediaserver@$MEDIA_SERVER_IP'
            alias sshdocker='ssh -i ~/.ssh/homelab docker@$DOCKER_SERVER_IP'
            alias sshgame='ssh -i ~/.ssh/homelab gameserver@$GAME_SERVER_IP'
            alias sshmonitor='ssh -i ~/.ssh/homelab monitor@$MONITOR_SERVER_IP'
            alias sshdevelopment='ssh -i ~/.ssh/homelab development@$DEVELOPMENT_SERVER_IP'

            # IP's
            export NAS_SERVER_IP=192.168.0.100
            export MEDIA_SERVER_IP=192.168.0.101
            export DOCKER_SERVER_IP=192.168.0.102
            export GAME_SERVER_IP=192.168.0.103
            export MONITOR_SERVER_IP=192.168.0.104
            export DEVELOPMENT_SERVER_IP=192.168.0.105
          '';
        };
        git = {
          enable = true;
          ignores = [ "*.swp" ];
          userName = name;
          userEmail = email;
          lfs = {
            enable = true;
          };
          extraConfig = {
            init.defaultBranch = "main";
            core = {
              editor = "code";
              autocrlf = "input";
            };
            pull.rebase = true;
            rebase.autoStash = true;
          };
          aliases = {
            st = "status";
            di = "diff";
            co = "checkout";
            ci = "commit";
            br = "branch";
            sta = "stash";
            ds = "diff";
            unstage = "reset";
            rum = "rebase master@{u}";
            lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
          };
        };
      };
      # Marked broken Oct 20, 2022 check later to remove this
      # https://github.com/nix-community/home-manager/issues/3344
      manual.manpages.enable = false;
    };
  };

  # Fully declarative dock using the latest from Nix Store
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
