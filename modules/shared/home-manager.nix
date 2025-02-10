{ config, pkgs, lib, ... }:

let name = "Ben Suskins";
    user = "bensuskins";
    email = "suskinsdevelopment@gmail.com"; in
{
  # Shared shell configuration
  zsh = {
    enable = true;
    autocd = false;
    plugins = [ # Todo use my plugins 
      # {
      #   name = "powerlevel10k";
      #   src = pkgs.zsh-powerlevel10k;
      #   file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      # }
      # {
      #   name = "powerlevel10k-config";
      #   src = lib.cleanSource ./config;
      #   file = "p10k.zsh";
      # }
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
  };
}
