{ hostRole }:

{
  ".local/bin/idea" = {
    source = ../../programs/idea/${hostRole}/idea;
    executable = true;
  };
  ".config/nvim" = {
    source = ../../programs/neovim;
    recursive = true;
  };
}
