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
    mini-nvim
  ];

  extraConfig = ''
    colorscheme tokyonight
    set number
    set cursorline
  '';
 
  extraLuaConfig = ''
    require('mini.statusline').setup()
    require('mini.starter').setup()
    require('mini.icons').setup()
    require('mini.git').setup()
    require('mini.sessions').setup()
    require('mini.visits').setup()

    vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>fc', '<cmd>Telescope git_commits<CR>', { noremap = true, silent = true })
  '';
}
