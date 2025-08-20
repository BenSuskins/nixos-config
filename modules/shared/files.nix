{ hostRole }:

{
  ".config/nvim" = {
    source = ../../programs/neovim;
    recursive = true;
  };
}
