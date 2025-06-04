{
  pkgs,
  userInfo,
  hostRole,
  ...
}:

{
  neovim = import ../shared/neovim.nix { inherit pkgs; };
  direnv = import ../shared/direnv.nix;
  zsh = import ../shared/zsh.nix { inherit hostRole; };
  git = import ../shared/git.nix { inherit (userInfo) name email; };
  zoxide = import ../shared/zoxide.nix;
}
