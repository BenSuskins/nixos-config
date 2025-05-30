{ config, pkgs, lib, home-manager, ... }:

let
  user = "bsuskins";
  name = "Ben Suskins";
  email = "bsuskins@ford.com";
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
    casks = pkgs.callPackage ./casks.nix {};
    onActivation.cleanup = "zap";
    masApps = {
    };
  };

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
          initContent = lib.mkBefore ''
            # General
            alias nixconfig="code ~/workspace/nixos-config"
            alias rebuild="cd ~/workspace/BenSuskins/nixos-config && darwin-rebuild build --flake .#work"
            alias switch="cd ~/workspace/BenSuskins/nixos-config && sudo darwin-rebuild switch --flake .#work"
            alias compare="cd ~/workspace/BenSuskins/nixos-config && nix store diff-closures /run/current-system ./result"
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
            push.default = "simple";
            fetch.prune = true;
            merge.ff = "only";
            color.ui = "auto";
            pull.ff = "only";
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

  local.dock.enable = true;
  local.dock.entries = [
    { path = "/System/Applications/Launchpad.app"; }
    { path = "/Applications/Slack.app"; }
    { path = "/System/Applications/Calendar.app/"; }
    { path = "/Applications/Iterm.app"; }
    { path = "/Applications/Safari.app"; }
    { path = "/System/Applications/Notes.app/"; }
  ];
  local.dock.username = user;
}
