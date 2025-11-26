{ hostRole }:

{
  enable = true;
  autocd = false;
  syntaxHighlighting.enable = true;
  autosuggestion.enable = true;
  shellAliases = import ./zsh/aliases.nix { inherit hostRole; };
  sessionVariables = import ./zsh/variables.nix;
  initContent = ''
    ${builtins.readFile ./zsh/functions.sh}
  '';
}
