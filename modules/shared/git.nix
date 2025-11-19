{ name, email, hostRole }:

{
  enable = true;
  ignores = [ "*.swp" ".envrc" ];
  settings ={
      alias = {
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
      user = {
        name = name;
        email = email;
      };
      init.defaultBranch = "main";
      core.autocrlf = "input";
      pull.rebase = true;
      pull.ff = "only";
      rebase.autoStash = true;
      push.default = "simple";
      push.autoSetupRemote = true;
      fetch.prune = true;
      merge.ff = "only";
      color.ui = "auto";
      user.signingkey = "~/.ssh/signing_key";
      gpg.format = "ssh";
      commit.gpgsign = true;
      gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
  };
  lfs = {
    enable = true;
  };
}
