{ hostRole }:

{
  enable = true;
  autocd = false;

  autosuggestion = {
    enable = true;
  };

  plugins = import ./zsh/plugins.nix;
  shellAliases = import ./zsh/aliases.nix { inherit hostRole; };
  sessionVariables = import ./zsh/variables.nix;
  initContent = ''
    ${builtins.readFile ./zsh/functions.sh}
  '';
}
