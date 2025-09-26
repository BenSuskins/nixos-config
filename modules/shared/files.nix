{ hostRole }:

{
  ".config/nvim" = {
    source = ../../programs/neovim;
    recursive = true;
  };

  "Library/Application Support/com.mitchellh.ghostty" = {
    source = ../../programs/ghostty;
    recursive = true;
  };
}
