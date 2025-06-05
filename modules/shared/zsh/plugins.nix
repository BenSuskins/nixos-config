[
  {
    name = "pure";
    file = "pure.zsh";
    src = builtins.fetchGit {
      url = "https://github.com/sindresorhus/pure";
      rev = "5c2158096cd992ad73ae4b42aa43ee618383e092";
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
]
