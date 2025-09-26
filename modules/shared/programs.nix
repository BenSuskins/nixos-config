{
  pkgs,
  userInfo,
  hostRole,
  ...
}:

{
  zoxide = {
    enable = true;
  };
  
  neovim = import ../shared/neovim.nix { inherit pkgs; };
  direnv = import ../shared/direnv.nix;
  ghostty = {
    enable = true;
  };
  zsh = import ../shared/zsh.nix { inherit hostRole; };
  git = import ../shared/git.nix {
    name = userInfo.name;
    email = userInfo.email;
    hostRole = hostRole;
  };
}
