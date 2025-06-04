{ hostRole }:
{
  enable = true;
  autocd = false;

  plugins = [
    {
      name = "pure";
      file = "pure.zsh";
      src = builtins.fetchGit {
        url = "https://github.com/sindresorhus/pure";
        rev = "92b8e9057988566b37ff695e70e2e9bbeb7196c8";
      };
    }
    {
      name = "zsh-syntax-highlighting";
      file = "zsh-syntax-highlighting.zsh";
      src = builtins.fetchGit {
        url = "https://github.com/zsh-users/zsh-syntax-highlighting/";
        rev = "5eb677bb0fa9a3e60f0eff031dc13926e093df92";
      };
    }
    {
      name = "zsh-autosuggestions";
      file = "zsh-autosuggestions.zsh";
      src = builtins.fetchGit {
        url = "https://github.com/zsh-users/zsh-autosuggestions";
        rev = "0e810e5afa27acbd074398eefbe28d13005dbc15";
      };
    }
    {
      name = "z";
      file = "z.sh";
      src = builtins.fetchGit {
        url = "https://github.com/rupa/z";
        rev = "d37a763a6a30e1b32766fecc3b8ffd6127f8a0fd";
      };
    }
  ];

  shellAliases = import ./zsh/aliases.nix { inherit hostRole; };

  sessionVariables = import ./zsh/variables.nix;

  initExtra = ''
    ${builtins.readFile ./zsh/functions.sh}
  '';
}
