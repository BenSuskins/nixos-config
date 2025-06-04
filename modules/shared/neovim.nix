{ pkgs }:
{
  enable = true;

  viAlias = true;
  vimAlias = true;

  plugins = with pkgs.vimPlugins; [
    tokyonight-nvim
  ];

  extraConfig = ''
    colorscheme tokyonight
  '';
}
