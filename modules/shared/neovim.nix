{ pkgs }:
{
  enable = true;

  viAlias = true;
  vimAlias = true;

  plugins = with pkgs.vimPlugins; [
    tokyonight-nvim
    plenary-nvim
    telescope-nvim
    nvim-treesitter
  ];

  extraConfig = ''
    colorscheme tokyonight
  '';
}
