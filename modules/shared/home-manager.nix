{ config, pkgs, lib, ... }:

let name = "Ben Suskins";
    user = "bensuskins";
    email = "suskinsdevelopment@gmail.com"; in
{
  # Shared shell configuration
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
      alias run='~/scripts/run.sh'
      alias zshconfig="code ~/.zshrc"
      alias nixconfig="code ~/workspace/BenSuskins/dotfiles"
      alias rebuild="cd ~/workspace/BenSuskins/dotfiles && make rebuild"

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
      st = "status"
      di = "diff"
      co = "checkout"
      ci = "commit"
      br = "branch"
      sta = "stash"
      ds = "diff"
      unstage = "reset"
      rum = "rebase master@{u}"
      lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
    }
  };
}
