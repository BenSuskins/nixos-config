{ pkgs }:
{
  enable = true;

  viAlias = true;
  vimAlias = true;

  plugins = with pkgs.vimPlugins; [
    # ...other plugins...
    tokyonight-nvim
  ];
}
