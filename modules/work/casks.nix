_:

let
  shared-casks = import ../shared/casks.nix;
in
shared-casks
++ [
  # Collaboration Tools
  "tuple"

  # Communication
  "ankerwork"
  "logi-options+"
  "slack"
]
