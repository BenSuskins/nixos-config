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
    which-key-nvim
    mini-nvim
  ];

  extraConfig = ''
    colorscheme tokyonight
  '';
 
  extraLuaConfig = ''
    require('mini.statusline').setup()
  '';
}
