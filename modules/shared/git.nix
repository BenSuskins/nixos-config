{ name, email, hostRole }:

{
  enable = true;
  ignores = [ "*.swp" ];
  userName = name;
  userEmail = email;
  lfs = {
    enable = true;
  };
  extraConfig = {
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
  }
  // (if hostRole == "work" then {
    gpg.format = "ssh";
    gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
    user.signingkey = "~/.ssh/signing_key";
  } else {})
  ;
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
}
