[
  {
    name = "pure";
    file = "pure.zsh";
    src = builtins.fetchGit {
      url = "https://github.com/sindresorhus/pure";
      rev = "92b8e9057988566b37ff695e70e2e9bbeb7196c8";
    };
  }
]
