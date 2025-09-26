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
  ghostty = import ../shared/ghostty.nix;
  direnv = import ../shared/direnv.nix;
  zsh = import ../shared/zsh.nix { inherit hostRole; };
  git = import ../shared/git.nix {
    name = userInfo.name;
    email = userInfo.email;
    hostRole = hostRole;
  };
}
