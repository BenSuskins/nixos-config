{
  enable = true;
  enableZshIntegration = true;
  settings = builtins.fromTOML (
    builtins.readFile ../../programs/starship/config.toml
  );
}